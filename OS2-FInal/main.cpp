#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/inotify.h>
#include <string.h>
#include <pthread.h>

#include <queue>
#include <mutex>
#include <condition_variable>
using namespace std;

#define LEN (1024 * (sizeof(struct inotify_event) + 16))


//  thread-safe queue based on the standard C++ queue implementation
//  employs deadlock prevention techniques
template <class T> class safeQueue
{
    private:
        queue<T> q;
        mutable mutex mut;
        condition_variable cond;
    public: 
        safeQueue(void) : q(), mut(), cond() {}
        ~safeQueue(void) {}

        void push(T t)
        {
            lock_guard<mutex> lock(mut);
            q.push(t);
            cond.notify_one();
        }

        T pop()
        {
            unique_lock<mutex> lock(mut);
            while(q.empty())
                cond.wait(lock);
            T val = q.front();
            q.pop();
            return val;
        }
};

safeQueue<char*> q;

/*
 *  the thread that handles the image queue
 *  constantly attempts to pull image file names within the safeQueue
 *  uses the imageMagick API to convert all image files to PNGs
 *  creates a process to convert each image
 */
void* queueThread(void* args)
{
    while(true)
    {
        char* data = q.pop();
        int pid = fork();
        
        if (pid == 0)
        {
            char infile[LEN];
            char outfile[LEN];
            
            // seek extension dot
            char* dot = strrchr(data, '.');

            // generate file names: infile -> image.x, outfile -> image.png
            int dotpos = dot - data + 1;
            strcat(infile,  "images/");
            strcat(infile, data);

            strcat(outfile, "results/");
            strncat(outfile, data, dotpos);
            strcat(outfile, ".png");
            
            // execute imageMagick's convert operation
            execlp("convert", "convert", infile, outfile, NULL);
            exit(1);
        }
    }
}

/*    
 *  main application; 
 *  actively monitors files moved to or created within the images directory via the inotify API
 *  initiates the queue management thread
 *  whenever a file is detected, pushes the file name in the safeQueue
 */
int main()
{
    pthread_t qthread;
    int tid = pthread_create(&qthread, NULL, &queueThread, NULL);
    char path[] = "images/";
    char buffer[LEN];
    int inofd, watchfd, length = 0;

    //initiates active monitoring
    inofd = inotify_init();
    watchfd = inotify_add_watch(inofd, path, IN_MOVED_TO | IN_CREATE);

    while(true)
    {
        length = read(inofd, buffer, LEN);
        if (length < 0)
        {
            perror ("oh no\n");
        }
        else
        {
            int i = 0;
            while (i < length)
            {
                //separates the file name from the event detected;
                //pushes the file name in the safeQueue
                struct inotify_event * event = (struct inotify_event*) &buffer[i];
                printf ("%s\n", event -> name);
                i += sizeof(inotify_event) + event -> len;
                q.push(event -> name);
            }
            printf ("over\n");
        }
    }
    printf("oh no!!");
}
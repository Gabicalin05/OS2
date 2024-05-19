#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/inotify.h>


#define LEN (1024 * (sizeof(struct inotify_event) + 16))


int main()
{
    char path[] = "images/";
    char buffer[LEN];
    int inofd, watchfd, length = 0;
    inofd = inotify_init();
    watchfd = inotify_add_watch(inofd, path, IN_MOVED_TO);

    while(1)
    {
        length = read(inofd, buffer, LEN);
        if (length < 0)
        {
            perror ("oh no\n");
        }
        else
        {
            printf ("yay\n");
        }
    }
}
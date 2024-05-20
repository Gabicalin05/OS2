#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/inotify.h>
#include <string.h>

#define LEN (1024 * (sizeof(struct inotify_event) + 16))


int main()
{
    int pd[2];
    if (pipe(pd) < 0)
    {
        perror("oh no pipe/n");
    }

    int pid = fork();

    if (pid == 0)
    {
        close(pd[1]);
        char buffer[LEN];
        char infile[LEN];
        char outfile[LEN];
        int length;

        while(1)
        {
            length = read(pd[0], buffer, LEN); // event -> name

            if (length > 0)
            {
                char* dot = strrchr(buffer, '.');
                int dotpos = dot - buffer + 1;
                strcat(infile,  "images/");
                strcat(infile, buffer);

                strcat(outfile, "results/");
                strncat(outfile, buffer, dotpos);
                strcat(outfile, ".png");
                
                execlp("convert", "convert", infile, outfile, NULL);
            }
                
        }
    }

    else
    {
        close(pd[0]);
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
                int i = 0;
                while (i < length)
                {
                    struct inotify_event * event = (struct inotify_event*) &buffer[i];
                    printf ("%s\n", event -> name);
                    i += sizeof(inotify_event) + event -> len;
                    write(pd[1], event -> name, strlen(event -> name));
                }
                printf ("over/n");
            }
        }
    }
}

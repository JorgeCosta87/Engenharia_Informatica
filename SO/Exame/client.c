#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <pthread.h>
#include <signal.h>
#include <fcntl.h>

#define NUM_OP 4
#define SERVER_FIFO "/tmp/server_pipe"

typedef struct packet{

    int pid;
    char op[20];
    int x,y;
}PACKET;

int main (int argc, char ** argv)
{

    int i, pid, nbytes;
    int fd, fd_server, ret, res;
    char cli_fifo[64];
    PACKET packet;
    struct timeval time;
    fd_set fread, fdtmp;

    if(access(SERVER_FIFO,F_OK) != 0 )
    {
        printf("Server offline\n");
        exit(0);
    }

    mkfifo(SERVER_FIFO, 0600);

    fd_server = open(SERVER_FIFO, O_WRONLY);

    pid = getpid();
    sprintf(cli_fifo, "cli_%d",getpid());

    mkfifo(cli_fifo, 0600);
    fd = open(cli_fifo,O_RDWR);

    packet.pid = pid;

    FD_ZERO(&fread);
    FD_SET(STDIN_FILENO,&fread);
    FD_SET(fd,&fread);
    
    time.tv_sec = 1;
    time.tv_usec = 0;

    do
    {
        printf("Give us two nums and operator : \n");
        fdtmp = fread;

        ret = select(fd + 1, &fdtmp,NULL,NULL,NULL);

        if(ret > 0)
        {

                if(FD_ISSET(STDIN_FILENO, &fdtmp))
                {
                    scanf("%d %d %[^\n]", &packet.x, &packet.y, packet.op);
                    printf("send packet:\nx: %d\ny: %d\nop: %s\n", packet.x, packet.y, packet.op);

                    nbytes = write(fd_server, &packet, sizeof(packet));
                    if(nbytes != sizeof(packet))
                        perror("Message not send");
                }
                
                if(FD_ISSET(fd, &fdtmp))
                {

                    nbytes = read(fd, &res, sizeof(res));

                    if(nbytes != sizeof(res))
                        perror("Message not received\n");

                    printf("\nResult: %d\n", res);
                }
            }
        }while(strcmp(packet.op, "quit") != 0 && res != 999);
      
   

    close(fd);
    close(fd_server);
    unlink(cli_fifo);

    return 0;
}
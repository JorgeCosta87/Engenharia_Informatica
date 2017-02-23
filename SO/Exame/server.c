#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <pthread.h>
#include <signal.h>

#define MAXCLIENTS 10
#define NUM_OP 4
#define SERVER_FIFO "/tmp/server_pipe"


typedef struct packet{

    int pid;
    char op[20];
    int x,y;
}PACKET;

typedef struct client{

    int pid;
    int fd;
}client;

typedef struct threadData{

    pthread_t id;
    int * running;
    int * fd_trash;
    client * listaClientes;
    void * retval;
} threadData;

threadData tData;

void quitserver(int s)
{
    int i, fd_client, nbytes, res;
    char client_fifo[64];

    printf("Signal type: %d\n", s);
    tData.running = 0;

    res = 999;

    for(i = 0 ; i < MAXCLIENTS ; i++)
    {
        if(tData.listaClientes[i].pid != 0)
        {   
            sprintf(client_fifo,"cli_%d",tData.listaClientes[i].pid);
            fd_client = open(client_fifo,O_RDWR);
            nbytes = write(fd_client, &res, sizeof(res));

            if(nbytes != sizeof(res))
                perror("Unbale to send the response");
            else
                printf("Response send with success!\n");
        
            close(fd_client);
        }
    }

    close(*tData.fd_trash);
    pthread_join(tData.id,NULL);

    unlink(SERVER_FIFO);
    printf("server is shuting down\n");
    exit(0);
}

void * clientListner(void * data)
{
    threadData * tData = (threadData *)data;
    PACKET packet;
    int fd, fd_trash, fd_client;
    int i, flags, nbytes, res;
    char client_fifo[64];
    char * operations[] = {"add", "sub", "mult", "div"};
    int regist;

    fd = open(SERVER_FIFO,O_RDONLY | O_NONBLOCK);
    fd_trash = open(SERVER_FIFO, O_WRONLY);

    tData->fd_trash = &fd_trash;

    flags = fcntl(fd,F_GETFL, 0);
    flags ^= O_NONBLOCK;
    fcntl(fd,F_SETFL,flags);


    while(tData->running)
    {   
        printf("Waitting for a message\n");
        nbytes = read(fd,&packet,sizeof(packet));

        if(nbytes != sizeof(packet))
            continue;
            
        regist = 1;
        for(int i = 0 ; i < MAXCLIENTS ; i++)
        {
            if(packet.pid == tData->listaClientes[i].pid)
                regist = 0;
        }
        if(regist == 1)
        {
            for(int i = 0 ; i < MAXCLIENTS ; i++)
            {
                if(tData->listaClientes[i].pid == 0)
                {
                    tData->listaClientes[i].pid = packet.pid;
                    break;
                }
            }
        }
        printf("Received packet:\nx: %d\ny: %d\nop: %s\n", packet.x, packet.y, packet.op);
        if(strcmp(packet.op,"add") == 0)
            res = packet.x + packet.y;
        else if (strcmp(packet.op,"sub") == 0)
            res = packet.x - packet.y;
        else if(strcmp(packet.op, "quit") == 0)
            quitserver(0); 
            

        sprintf(client_fifo,"cli_%d",packet.pid);
        fd_client = open(client_fifo,O_RDWR);
        nbytes = write(fd_client, &res, sizeof(res));

        if(nbytes != sizeof(res))
            perror("Unbale to send the response");
        else
            printf("Response send with success!\n");
        
        close(fd_client);
        
    }
}

int main(int argc, char ** argv)
{
    client clients[MAXCLIENTS];


    int i, c, running = 0;
    char buffer[128];

    signal(SIGINT,quitserver);
    printf("server pid: %d \n", getpid());
    mkfifo(SERVER_FIFO, 0600);

    for(i = 0 ; i < MAXCLIENTS ; i++)
        clients[i].pid = 0;

    tData.listaClientes = clients;
    tData.running = &running;

    pthread_create(&tData.id,NULL,clientListner,(void*)&tData);

    do
    {
        printf("servidor$: "); fflush(stdout);
        scanf(" %[^\n]", buffer);

        buffer[strlen(buffer)] = '\0';
        if(strcmp(buffer,"list") == 0)
        {
            for(i = 0, c = 0 ; i < MAXCLIENTS ; i++)
            {
                if(clients[i].pid != 0)
                {
                    printf("Client: %d\n", clients[i].pid);
                    c++;
                }
            }
                printf("\nNum of clients: %d \n", c);
        }

    }while(strncmp(buffer,"quit", 4) != 0);

    quitserver(0);

    return 0;
}
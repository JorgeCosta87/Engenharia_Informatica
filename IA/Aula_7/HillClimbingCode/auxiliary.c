#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "auxiliary.h"


// Reads the input file
int* init_data(char *name, int *n, int *iter)
{
	FILE *f;
	int *p, *q;
	int i, j;

	f=fopen(name, "r");
	if(!f)
	{
		printf("Error accesing file\n");
		exit(1);
	}

	// Number of iteratios
	fscanf(f, " %d", iter);

	// Number of nodes
	fscanf(f, " %d", n);

	// Memory allocation

	p = malloc(sizeof(int)*(*n)*(*n));
	if(!p)
	{
	    printf("Error in memory allocation\n");
	    exit(1);
	}
	q=p;

	// Fill matrix
	for(i=0; i<*n; i++)
	 for(j=0; j<*n; j++)
	   fscanf(f, " %d", q++);
	fclose(f);

	return p;
}



// creates the initial solution
// Parameters: solution, number of nodes
void create_initial_sol(int *sol, int v)
{
	int i, x;

	for(i=0; i<v; i++)
	 sol[i]=0;

	for(i=0; i<v/2; i++)
    {
        do
			x = random_l_h(0, v-1);
        while(sol[x] != 0);
        sol[x]=1;
    }
}

// prints a solution
// Parameters: solution, number of nodes
void write_sol(int *sol, int vert)
{
	int i;

	printf("\nSet A: ");
	for(i=0; i<vert; i++)
		if(sol[i]==0)
			printf("%2d  ", i);
	printf("\nSet B: ");
	for(i=0; i<vert; i++)
		if(sol[i]==1)
			printf("%2d  ", i);
	printf("\n");
}


// copies vector b to a (length n)
void replace_solution(int a[], int b[], int n)
{
    int i;
    for(i=0; i<n; i++)
        a[i]=b[i];
}


// Init random number generator
void init_rand()
{
	srand((unsigned)time(NULL));
}


// Returns a random integer value between min e max
int random_l_h(int min, int max)
{
	return min + rand() % (max-min+1);
}


// Returns a random value between [0, 1]
float rand_01()
{
	return ((float)rand())/RAND_MAX;
}



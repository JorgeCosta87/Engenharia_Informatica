#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "algorithm.h"
#include "auxiliary.h"

#define DEFAULT_RUNS 10

int main(int argc, char *argv[])
{
    char name_file[100], dir[100];
    int *graph, *sol, *best;
    int vert, num_iter, k, runs, cost, best_cost;
	float mbf = 0.0;

	if(argc == 3)
	{
		runs = atoi(argv[2]);
		strcpy(name_file, argv[1]);
	}
	else if(argc == 2)
	{
		runs = DEFAULT_RUNS;
        strcpy(name_file, argv[1]);
    }
	else
    {
		runs = DEFAULT_RUNS;
        printf("Filename: ");
        gets(name_file);
    }

	if(runs <= 0)
		return 0;

	init_rand();
    strcpy(dir,"/Users/abs/Documents/Class7/");
    strcat(dir,name_file);
    // Fill adjacency matrix
    graph = init_data(dir, &vert, &num_iter);

	sol = malloc(sizeof(int)*vert);
	best = malloc(sizeof(int)*vert);

	if(sol == NULL || best == NULL)
	{
		printf("Error in memory allocation");
		exit(1);
	}

	for(k=0; k<runs; k++)
	{
		// Create initial solution
		create_initial_sol(sol, vert);

		// Hill climbing
		cost = hill_climbing(sol, graph, vert, num_iter);

		// Write results - repetiotion K
		printf("\nRepetition %d:", k);
		write_sol(sol, vert);
		printf("Final cost: %2d\n", cost);

		mbf += cost;
		if(k==0 || best_cost > cost)
		{
			best_cost = cost;
			replace_solution(best, sol, vert);
		}
    }

	// Write final results
	printf("\n\nMBF: %f\n", mbf/k);
	printf("\nBets solution found");
	write_sol(best, vert);
	printf("Final cost: %2d\n", best_cost);

	free(graph);
    free(sol);
	free(best);
    return 0;
}





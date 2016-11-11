
#include <stdio.h>
#include <stdlib.h>
#include "algorithm.h"
#include "functions.h"
#include "auxiliary.h"

#define TMAX 100
#define TMIN 0.01

// Creates a neighbor
// Receives: current solution, neighbor, number of nodes
//swap two vertices
void create_neighbor(int a[], int b[], int n)
{
    int i, p1, p2;

    for(i=0; i<n; i++)
        b[i]=a[i];

	// Finds position with value 0
    do
        p1=random_l_h(0, n-1);
    while(b[p1] != 0);

	// Finds position with value 1
    do
        p2=random_l_h(0, n-1);
    while(b[p2] != 1);

	// Swap
    b[p1] = 1;
    b[p2] = 0;
}



// Hill climbing first-choice
// Parameters: solution, adjacency matrix, number of nodes and number of iterations
// Returns: cost of best found solution

int hill_climbing(int sol[], int *mat, int vert, int num_iter)
{
    int *new_sol, cost, cost_neighbor, i;

	new_sol = malloc(sizeof(int)*vert);
    if(new_sol == NULL)
    {
        printf("Memory allocation error");
        exit(1);
    }

	// Avalia solucao inicial
    cost = compute_fitness(sol, mat, vert);

    for(i=0; i<num_iter; i++)
    {
		// generetes a neighbor
		create_neighbor(sol, new_sol, vert);

		// evaluates the neighbor
		cost_neighbor = compute_fitness(new_sol, mat, vert);

		// acept neighbor if it has a lower fitness (minimization problem)
        if(cost_neighbor <= cost)
        {
			replace_solution(sol, new_sol, vert);
			cost = cost_neighbor;
        }
    }
    free(new_sol);

    return cost;
}


// Hill climbing first-choice
// Parameters: solution, adjacency matrix, number of nodes and number of iterations
// Returns: cost of best found solution

int simulated_annealing(int sol[], int *mat, int vert)
{
    int *new_sol, cost, cost_neighbor, k, iterations = 0;
    float temperature = TMAX;
	new_sol = malloc(sizeof(int)*vert);
    if(new_sol == NULL)
    {
        printf("Error in memory allocationa");
        exit(1);
    }

	// Avalia solucao inicial
    cost = compute_fitness(sol, mat, vert);

    while(temperature > TMIN) //algorithm stops when the minimum temperature is obtained
    {

		// inner cycle to creates several neighbors
		for(k = 0; k < 5; k ++){
            create_neighbor(sol, new_sol, vert);

            // evaluates the neighbor
            cost_neighbor = compute_fitness(new_sol, mat, vert);

            // acept neighbor if it has a lower fitness (minimization problem)
            if(cost_neighbor < cost)
            {
                replace_solution(sol, new_sol, vert);
                cost = cost_neighbor;
            }
            else{
                    //complete the code.
                    //In which circunstances simulated annealing acepts worst solutions?


            }
		}
		temperature = temperature * 0.99; // decrements the temperature
		iterations++;
    }
    printf("Simulate Annealing performed %d iterations\n", iterations);
    free(new_sol);

    return cost;
}

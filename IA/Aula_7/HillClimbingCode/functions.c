
#include "functions.h"

// Computes the quality of a solution
// Receives: solution, adjacency matrix, ny+umber of nodes
// Returns: cost (quality)
int compute_fitness(int a[], int *mat, int vert)
{
	int total=0;
	int i, j;

	for(i=0; i<vert; i++)
		if(a[i]==0)
		{
			for(j=0; j<vert;j++)
				if(a[j]==1 && *(mat+i*vert+j)==1)
				    total++;
		}
	return total;
}


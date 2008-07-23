#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <R.h>
#include <Rmath.h>
/*libraries to include*/

/*SKQ: This takes an integer n and returns one random integer?*/
int intrand(int n) {
    double u;
    u = unif_rand();
    return((int)(u*n));/*SKQ: I do not follow this line*/
}

/* inefficient but probably not important;
 * allocate and copy in vector to matrix */
double **vectomat(double *v,int row,int column) /*SKQ: I need a refresher on pointers.*/{
    int i,j;
    double **m;

    m = (double **)R_alloc(row,sizeof(double *));
    for (i=0; i<row; i++) /*SKQ: does i++ mean i+1? Doe the for loop go to row or only to less than row?*/{
        m[i] = (double *)R_alloc(column,sizeof(double));/*SKQ: I do not follow this line*/
        for (j=0; j<column; j++) {
            m[i][j] = v[row*j+i];  /* R uses column-first ordering */
        }
    }
    return(m);
}

/* copy matrix back into vector */
void mattovec(double *v,double **m,int row,int column) {
    int i,j,k;
    k=0;
    for (j=0; j<column; j++) {
        for (i=0; i<row; i++) {
            v[k++] = m[i][j];
        }
    }
}


void trialswap(double *v, int *pintervals, int * prow, int * pcolumn) /*SKQ: why are there spaces?*/{
    long int trial;
    int i,j,k,l;/*SKQ: I assume it is ok to have all the ints on one line?*/
    int row, column;
    int intervals;
	double tmp;
    double **m;/*SKQ: are the two stars because m is a 2D matrix?*/

    row = *prow;
    column = *pcolumn;
    intervals = *pintervals;

    m = vectomat(v,row,column);/*SKQ: Is v passed to trialswap as a matrix or vector?*/

    GetRNGstate();
    for(trial=0;trial<intervals;trial++)
    {
        i=intrand(row);/*Choose a random row*/
        while((j=intrand(row))==i);/*SKQ: It is ok not to have brackets? make sure that you do not randomly choose the same row as before*/
        k=intrand(column);/*Choose a random column*/
        while((l=intrand(column))==k);/*make sure that you do not randomly choose the same column as before*/
        if((m[i][k]>0.0 && m[j][l]>0.0 && m[i][l]+m[j][k]==0.0)||(m[i][k]+m[j][l]==0.0 && m[i][l]>0.0 && m[j][k]>0.0))
		{
			//currently swaps abundances within columns (=species)
			//should have a switch to swap abundances within rows, columns, or random
			tmp = m[i][k];
			m[i][k] = m[j][k];
			m[j][k] = tmp;
			tmp = m[i][l];
			m[i][l] = m[j][l];
			m[j][l] = tmp;
		}
    }
    mattovec(v,m,row,column);
    PutRNGstate();
}

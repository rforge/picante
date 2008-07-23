#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <R.h>
#include <Rmath.h>

int intrand(int n) {
    double u;
    u = unif_rand();
    return((int)(u*n));
}

/* inefficient but probably not important;
 * allocate and copy in vector to matrix */
double **vectomat(double *v,int row,int column) {
    int i,j;
    double **m;
    
    m = (double **)R_alloc(row,sizeof(double *));
    for (i=0; i<row; i++) {
        m[i] = (double *)R_alloc(column,sizeof(double));
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


void trialswap(double *v, int *pintervals, int * prow, int * pcolumn) {
    long int trial;
    int i,j,k,l;
    int row, column;
    int intervals;
	double tmp;
    double **m;
    
    row = *prow;
    column = *pcolumn;
    intervals = *pintervals;
    
    m = vectomat(v,row,column);
    
    GetRNGstate();
    for(trial=0;trial<intervals;trial++)
    {
        i=intrand(row);
        while((j=intrand(row))==i);
        k=intrand(column);
        while((l=intrand(column))==k);
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
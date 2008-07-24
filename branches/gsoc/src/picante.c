#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <R.h>
#include <Rmath.h>
/*libraries to include*/

/*This takes an integer n and returns one random integer*/
int intrand(int n)
{
    double u;
    u = unif_rand();
    return((int)(u*n));/*Cast the double as an integer*/
}

/* inefficient but probably not important;
 * allocate and copy in vector to matrix */
double **vectomat(double *v,int row,int column)
{
    int i,j;
    double **m;

    m = (double **)R_alloc(row,sizeof(double *));
    for (i=0; i<row; i++)
    {
        m[i] = (double *)R_alloc(column,sizeof(double));
        for (j=0; j<column; j++)
        {
            m[i][j] = v[row*j+i];  /* R uses column-first ordering */
        }
    }
    return(m);
}

/* copy matrix back into vector */
void mattovec(double *v,double **m,int row,int column)
{
    int i,j,k;
    k=0;
    for (j=0; j<column; j++)
    {
        for (i=0; i<row; i++)
        {
            v[k++] = m[i][j];
        }
    }
}


void trialswap(double *v, int *pintervals, int *prow, int *pcolumn)
{
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
        i=intrand(row);//Choose a random row
        while((j=intrand(row))==i);//make sure that you do not randomly choose the same row as before
        k=intrand(column);//Choose a random column
        while((l=intrand(column))==k);//make sure that you do not randomly choose the same column as before
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

void richnessindex(double *v, int *prow, int *pcolumn)
{
    int i, j, k, q, p, b, sum=0, we;
    int row, column;
    double **m, **randm;
    row = *prow;
    column = *pcolumn;
    q = column;
    double *randrow[column];

    m = vectomat(v,row,column);//Change the vector v passed from R back to a Matrix

    /*make list of ONES THE LENGTH OF THE COLUMNS*/
    int s[column];
    int t;
    for (t=0;t<column;t++)
    {
        s[t]=1;
    }
    //////////////////////////////////

    randm = (double **)R_alloc(row,sizeof(double *)); //Initiate the Random Matrix
    //randrow = (double *)R_alloc(column,sizeof(double)); //Initiate a vector to hold the community that is being randomized

    /*Begin looping to create random matrix*/
    for (i=0; i<row; i++)
    {
        randm[i] = (double *)R_alloc(column,sizeof(double)); //Initiate the Random community at row i

        for (p=0;p<column;p++) //Get obs community i
        {
            randrow[i][p]=m[i][p];
        }

        for (j=0; j<column-1; j++) // randomly sample one species at a time across all rows of community i
        {
            for(b=0; b<q; b++)// Sum vector s to give the number to be passed to intrand
                {
                sum = sum + s[i];
                }
            k=intrand(sum);
            randm[i][j]=randrow[i][k];//Assign element randm i,j a random element from the community
            double *randrow[q-1];//Reinitialize randrow THIS WILL PROB BE A BUG IN THE CODE

            /*Fill randrow with all the elements of community i that have not been sampled yet
            A bug may also come up here if q=k...*/
            we=0;
            while(we<q-1)
                {
                for (p=0;p<q-k;p++)
                    {
                    randrow[i][we]=m[i][p];
                    we++;
                    }
                for (p=k+1;p<q;p++)
                    {
                    randrow[i][we]=m[i][p];
                    we++;
                    }
                }
            q=q-1;
            }
        }

    mattovec(v,randm,row,column);

    PutRNGstate();
}

void richness(double *v, int *prow, int *pcolumn)
{

    int i,j,k,l;
    int row, column;
	double tmp;
    double **m;

    row = *prow;
    column = *pcolumn;

    m = vectomat(v,row,column);

    GetRNGstate();
    for(i=0;i<row;i++)
    {
        for (j=0;j<column;j++)
        {
            while((k=intrand(column))==j);//choose another column (species) at random
            tmp = m[i][j];
            m[i][j] = m[i][k];
            m[i][k] = tmp;
		}
    }
    mattovec(v,m,row,column);
    PutRNGstate();
}

void frequency(double *v, int *prow, int *pcolumn)
{

    int i,j,k,l;
    int row, column;
	double tmp;
    double **m;

    row = *prow;
    column = *pcolumn;

    m = vectomat(v,row,column);

    GetRNGstate();
    for(i=0;i<column;i++)
    {
        for (j=0;j<row;j++)
        {
            while((k=intrand(row))==j);//choose another row (sample) at random
            tmp = m[j][i];
            m[j][i] = m[k][i];
            m[k][i] = tmp;
		}
    }
    mattovec(v,m,row,column);
    PutRNGstate();
}

void independentswap(double *v, int *pintervals, int *prow, int *pcolumn)
{
    long int swap;
    int swapped;
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
    for(swap=0;swap<intervals;swap++)
    {
        swapped = 0;
        while(swapped==0) {
            i=intrand(row);//Choose a random row
            while((j=intrand(row))==i);//make sure that you do not randomly choose the same row as before
            k=intrand(column);//Choose a random column
            while((l=intrand(column))==k);//make sure that you do not randomly choose the same column as before
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
                swapped = 1;
            }
        }
    }
    mattovec(v,m,row,column);
    PutRNGstate();
}

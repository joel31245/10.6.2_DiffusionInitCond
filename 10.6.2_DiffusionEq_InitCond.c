#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/*
    PROGRAM DISPLAYS THE DIFFUSION EQUATION FOR ENERGY? IN A BEAM THROUGH TIME
    _____EXPLICIT_METHOD__________IMPLICIT_METHOD__________CRANK-NICOLSON_METHOD_____
    Users Can Change the:
     - initializer multiple (n)     [defined]
     - density coefficient  (D)     [defined]
     - when time stops      (tEND)  [defined]               Meaning for calculation. Program does not help with midlife crises.
     - length of the board  (xEND)  [defined]
     - time step            (dt)    [defined]
     - position step        (dx)    [defined]
*/

// These are equation/situation specific definitions
double n = 1;
double D = 1.0;
double tEnd = 1.0;
double xEnd = M_PI;
//
double lam = .4;
double dx = M_PI/10;
double dt = (lam/D*dx*dx);
int xSize = (double)xEND/dx +1;
int tSize = (double)tEND/dt +1;
char fileName[100];
char fileNameTimeSepCSV[100];
char fileNameBlockCSV[100];
char fileNameBlockActualCSV[100];
char errorFile[101];
char continu = 'y';


/*
   x : 0->PI
   t : 0->1
*/


// MINI FUNCTION SET TO 0 BY DEFAULT CONDITIONS defined by problem
double F( double t, double x ){ return 0; }
// STEPWISE COMPUTATIONAL FUNCTIONS
void initializeU( double u[xSize][tSize] );
void boundaryConditions( double u[tSize][xSize], int tRow );
void Explicit( double[tSize][xSize], int );
void Implicit( double[tSize][xSize])
void CNfillRow( double[tSize][xSize], int );
// DISPLAY FUNCTION
void printAll( double u[tSize][xSize] );
// EXACT FUNCTION
double exact( double t, double x ){ return exp(-pow(n-.5,2)*pow(M_PI,2)*t) * cos((n-.5)*x); }

int main()
{
    double U[tSize][xSize];

    while (continu == 'y'){

        printf("Please Enter the file name in which these values will be stored: \n");
        scanf(" %s", fileName);
        strcpy(fileNameBlockCSV, fileName);
        strcpy(errorFile, fileName);
        strcpy(fileNameBlockActualCSV, fileName);
        strcat(fileNameBlockCSV, "BLOCK.csv");
        strcat(errorFile, "ERROR.csv");
        strcat(fileNameBlockActualCSV, "BLOCKACTUAL.csv");

        /* STEP 1: Set the initial U at t=0 for the length of the beam x: 0->PI */
        initializeU( U );

        int i; // goes through all the time steps
        for( i=1; i<tSize; i++ ){
        /* STEP 2: Boundary Conditions for Next time Step */
            boundaryConditions( U, i );
        /* STEP 3: Filling in the rest of the current time Step */
            CNfillRow( U, i );
        }


        /* STEP 4: Displaying the Results */
        printAll( U );

        printf("\n\nLambda Marker to compare to Explicit:\n %lf\n\n", lam);

        printf("\nWould you like to continue again? (y/n) ");
        scanf(" %c", &continu);
    }


    return 0;
}

// PRINTING FUNCTION
void printAll( double u[tSize][xSize] ){
    int i, j; double error;

    FILE *ef = fopen(errorFile, "w");
    FILE *bf = fopen(fileNameBlockCSV, "w");
    FILE *abf = fopen(fileNameBlockActualCSV, "w");

    for( i=0; i<tSize; i++ ){
        for( j=0; j<xSize; j++ ){
            if( j==0 )printf("ESTIMATE:\t");
            printf("%lf\t", u[i][j] );
            fprintf(bf,"%lf,", u[i][j]);
        }
        fprintf(bf,"\n");

        for( j=0; j<xSize; j++ ){
            if( j==0 )printf("\nACTUAL:\t\t");
            printf("%lf\t", exact(i*dt, j*dx) );
            fprintf(abf, "%lf,", exact(i*dt, j*dx) );
        }
        fprintf(abf, "\n" );

        for( j=0; j<xSize; j++ ){
            if( j==0 )printf("\nERROR:\t\t");
            error = fabs(exact(i*dt, j*dx)-u[i][j])/exact(i*dt, j*dx) *100;
            if( u[i][j] == 0 && ( j==0 || j==xSize-1) ) error = 0.0;
            printf("%lf\t", error );
            fprintf(ef, "%lf,", error );
        }
        fprintf(ef, "\n");

        printf("\n\n\n\n");
    }

    fclose(ef);
    fclose(abf);
    fclose(bf);

}


void initializeU( double u[tSize][xSize] ){
    int i;
    for( i=0; i<xSize; i++ ){
        u[0][i] = cos((n-.5)*i*dx);
    }
}
void boundaryConditions( double u[tSize][xSize], int tRow ){
    u[tRow][0] = 0;
    u[tRow][xSize-1] = 0;
}

void CNfillRow( double u[tSize][xSize], int t){
    /* STEP A: SETTING UP THE Tridiagonal */
    int N = xSize-1;
    double alpha[N], a=1+lam, b=-lam/2, c=-lam/2, g[N]; int j;

    /* STEP B: FORWARD THROUGH THE alpha's AND g's */
    alpha[1] = a;
    g[1] = ( lam/2.0*u[t-1][0] + (1-lam)*u[t-1][1] + lam/2.0*u[t-1][2] );

    for( j=2; j<N; j++ ){
        alpha[j] = a - (b*c)/alpha[j-1];
        g[j] = ( ( lam/2.0*u[t-1][j-1] + (1-lam)*u[t-1][j] + lam/2.0*u[t-1][j+1] ) - (b/alpha[j-1]*g[j-1]) );
    }

    /* STEP C: BACKWARD THROUGH u[t][j] */
    // Starting 2 below max because the end is set to 0 by "boundaryConditions" as it should be
    u[t][xSize-2] = g[N-1]/alpha[N-1];

    for( j=N-2; j>0; j-- ){
        u[t][j] = ( g[j] - c*u[t][j+1] )/alpha[j];
    }

}

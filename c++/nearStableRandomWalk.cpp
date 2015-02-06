// With the aim of changing a mix matrix while maintaining "near" stability, I
// sketched this program. It starts with a known-stable "loop" topology, then
// iteratively, randomly changes the matrix such that the eigenvalues of the
// matrix remain near 1.
//
// Known issues: This program does not check that the eigenvectors are linearly
// independent. It's possible that this program will just fail if that check is
// added. Perhaps we can take that LU decomposition, then calculate the
// determinant. a determinant near 0 would be bad and lead to a retry.
//
// what's real and what's complex? is the mix matrix real? should it be complex?
//
// use gsl_rng_mt19937 instead of cmath/rand()
//
// on OSX...
// install dependencies: brew install gsl
// compile and link: c++ this_file.cpp -lgsl -lcblas -o some_binary
//
// -- Karl Yerkes 2015/01/24
//

#include <stdio.h>
#include <string.h>
#include <gsl/gsl_math.h>
#include <gsl/gsl_complex_math.h>
#include <gsl/gsl_eigen.h>

#define N (6)  // number of players
#define ITERATIONS (10000)
#define MAXIMUM_DISTANCE (0.005)
#define MAXIMUM_DISTURBANCE (0.01)
#define MAXIMUM_ATTEMPTS (100)
#define RANDOM_SEED (1)
//#define PRETTY_PRINT // alternative to machine-readable output

int main(void) {
  srand(RANDOM_SEED);

  // allocate the mix matrix and initialize it as a simple ring
  //
  double matrix[N * N];
  memset(matrix, 0, sizeof(matrix));
  matrix[N - 1] = 1;
  for (int k = 0; k < N - 1; k++) matrix[N + N * k + k] = 1;

#ifdef PRETTY_PRINT

  //  pretty-print the starting matrix
  //
  printf("Matrix (%lf)\n", 1.0);
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      printf("% 2.02f ", matrix[N * i + j]);
    }
    printf("\n");
  }
  printf("\n");

#else

  // dump matrix data for visualization
  //
  printf("%d %lf ", N, 1.0);
  for (int i = 0; i < N * N; i++) printf("%lf ", matrix[i]);
  printf("\n");

#endif

  // starting with a known-stable (marginally) matrix, add noise such that the
  // matrix remains near stable (maximum eigenvalue within some distance of 1).
  //
  int attempts = 1;
  for (int n = 0; n < ITERATIONS; n++) {
    double candidate[N * N];
    memcpy(candidate, matrix, sizeof(matrix));

    // add noise
    //
    for (int i = 0; i < N * N; i++)
      candidate[i] += MAXIMUM_DISTURBANCE * (2.0 * rand() / RAND_MAX - 1);

    // backup the candidate because it will be changed in place soon
    //
    double backup[N * N];
    memcpy(backup, candidate, sizeof(matrix));

    gsl_matrix_view m = gsl_matrix_view_array(candidate, N, N);
    gsl_vector_complex *eval = gsl_vector_complex_alloc(N);
    gsl_matrix_complex *evec = gsl_matrix_complex_alloc(N, N);
    gsl_eigen_nonsymmv_workspace *w = gsl_eigen_nonsymmv_alloc(N);
    gsl_eigen_nonsymmv(&m.matrix, eval, evec, w);  // changes candidate in place
    gsl_eigen_nonsymmv_free(w);
    gsl_eigen_nonsymmv_sort(eval, evec, GSL_EIGEN_SORT_ABS_DESC);

    double largestEigenvalue = gsl_complex_abs(gsl_vector_complex_get(eval, 0));
    double distanceFromUnitCircle = largestEigenvalue - 1.0;
    if ((distanceFromUnitCircle < MAXIMUM_DISTANCE) &&
        (distanceFromUnitCircle > -MAXIMUM_DISTANCE)) {
      memcpy(matrix, backup, sizeof(matrix));

#ifdef PRETTY_PRINT

      printf("Matrix (%lf) [after %d attempts]\n", largestEigenvalue, attempts);

      for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) printf("% 2.02f ", matrix[N * i + j]);
        printf("\n");
      }
      printf("\n");

#else

      printf("%d %lf ", N, largestEigenvalue);
      for (int i = 0; i < N * N; i++) printf("%lf ", matrix[i]);
      printf("\n");

#endif

      attempts = 1;
    } else {
      attempts++;
      if (attempts > MAXIMUM_ATTEMPTS) {
        printf("Too hard. Dying!\n");
        exit(-1);
      }
    }

    // XXX check that eigenvectors are linearly independent

    gsl_vector_complex_free(eval);
    gsl_matrix_complex_free(evec);
  }

  return 0;
}

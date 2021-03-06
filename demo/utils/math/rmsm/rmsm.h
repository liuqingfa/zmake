#ifndef _RMSM_H_
#define _RMSM_H_

/*
 * Row Major Sparse Matrix (RMSM)
 *
 * Optimized for matrix(real,sparse)-vector(real/complex,dense) multiplication.
 *
 * NOTE:
 * 	1. The user interface is opaque.
 * 	2. The user owns any vectors that are passed to RMSM functions.
 * 	3. RMSM only supports real matrix, though you can multiply this real 
 * 	matrix by either real or complex vectors.
 */


#include <complex.h>
#include <vector>

#ifdef __cplusplus
extern "C" {
#endif
enum {
	RMSM_ABSERR = 0,
	RMSM_RELERR
};

// internal use only
typedef struct {
	int col;
	double val;
} vessel_t;

struct st_rmsm {
	int     status; // internal status
	int     len; // number of columns/rows
	int    *rsz; // rsz[k] = number of non-zero elements in the k-th row
	int    *col; // col[k] = the column number of val[k]
	/*
	 * val[k] = k-th non-empty element in the row-major serial
	 * representation of the matrix
	 */
	double *val; 
	std::vector<vessel_t> *tmp; // internal use only
};

struct st_rmsm *rmsm_create(const int len);
void rmsm_add(struct st_rmsm *m, const double val, const int row, const int col);

/*
 * Delete zero or near zero elements. The threshold for deletion is eps.
 * flag : RMSM_ABSERR = eps is absolute error
 *        RMSM_RELERR = eps is relative error
 * Relative error is calcaulted using the L2 norm of the matrix.
 */
void rmsm_pack(struct st_rmsm *m, const int flag, const double eps);
void rmsm_print_info(const struct st_rmsm *m);
void rmsm_destroy(struct st_rmsm *m);
void rmsm_mul(const struct st_rmsm *m,
		const double *restrict in,
		double *restrict out);
void rmsm_mul_complex(const struct st_rmsm *m,
		const double _Complex *restrict in,
		double _Complex *restrict out);

// return the number of non-empty elements in this matrix
int rmsm_num_elements(const struct st_rmsm *m);

// count the number of multiplications and additions in a single M-V mul
int rmsm_count_operation(const struct st_rmsm *m);

#ifdef __cplusplus
}
#endif 



#endif /* end of include guard */

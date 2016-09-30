#include <stdio.h>
#include <cuda_runtime.h>


__global__ void vectorAdd(float *A, float *B, float *C, int numElements)
{
	int i = blockIdx.x * blockDim.x + threadIdx.x;

	if(i < numElements)
	{
		C[i] = A[i] + B[i];
	}
}



int main()
{
	int numElements = 1000;
	size_t size = numElements * sizeof(float);

	float *h_A, *h_B, *h_C;

	h_A = (float *) malloc(size);
	h_B = (float *) malloc(size);


	for(int i=0; i < numElements; i++)
	{
		h_A[i] = 1;
		h_B[i] = 2;
	}




	float * d_A = NULL;
	float * d_B = NULL;

	cudaMalloc( (void **)&d_A, size );
	cudaMalloc( (void **)&d_B, size );

    cudaMemcpy(d_A, h_A, size, cudaMemcpyHostToDevice);
    cudaMemcpy(d_B, h_B, size, cudaMemcpyHostToDevice);


	float * d_C = NULL;

	cudaMalloc( (void **)&d_C, size  );



}
#include <cuda_runtime.h>
#include <unistd.h>
#include <iostream>

__global__ void noop_kernel(int iters) {
    for (int i = 0; i < iters; ++i) {
        __nanosleep(100); // Supported on Volta and higher
    }
}

int main() {
    dim3 grid(1);
    dim3 block(32); // 1 warp
    int iters = 10000; // 10ms target for kernels

    while (true) {
        noop_kernel<<<grid, block>>>(iters);
        cudaDeviceSynchronize();

        usleep(1000); // 1ms pause
    }

    return 0;
}

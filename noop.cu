#include <cuda_runtime.h>
#include <unistd.h>
#include <iostream>

__global__ void noop_kernel(int iters) {
    __global__ void noop_kernel(int iters) {
        // A simple busy-wait loop to simulate delay
        for (int i = 0; i < iters; ++i) {
            // Simulated delay (busy-wait)
            volatile int x = 0;
            for (int j = 0; j < 100; ++j) {
                x++;
            }
        }
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

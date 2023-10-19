#include <cuda_runtime.h>
#include <stdio.h>

int main() {
    int deviceCount;
    cudaGetDeviceCount(&deviceCount);

    for (int dev = 0; dev < deviceCount; dev++) {
        cudaDeviceProp deviceProp;
        cudaGetDeviceProperties(&deviceProp, dev);

        printf("GPU Device %d: %s\n", dev, deviceProp.name);
        printf("    Total GPU Memory: %lu bytes\n", (unsigned long)deviceProp.totalGlobalMem);
        
        size_t freeMemory, totalMemory;
        cudaMemGetInfo(&freeMemory, &totalMemory);
        printf("    Available GPU Memory: %lu bytes\n", (unsigned long)freeMemory);
    }

    return 0;
}

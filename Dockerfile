# Use official CUDA runtime image
FROM nvidia/cuda:12.3.1-runtime-ubuntu20.04

# Install minimal build tools and dependencies
RUN apt-get update && \
    apt-get install -y build-essential cuda-samples-12-3 && \
    rm -rf /var/lib/apt/lists/*

# Copy and build the no-op kernel
WORKDIR /app
COPY noop.cu .
RUN nvcc -o noop noop.cu

# Default command: run the loop
CMD ["./noop"]

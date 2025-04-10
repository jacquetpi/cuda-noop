# cuda-noop

**cuda-noop** is a minimal containerized CUDA application designed to simulate the presence of an active GPU process without performing significant computation. It serves as a lightweight tool for studying GPU scheduling behavior, time-slicing, and process interference, particularly in multi-process environments.

---

## Purpose

In GPU-enabled systems, particularly those used for high-performance computing (HPC) or Cloud GPU virtualization, it is often necessary to analyze how concurrent processes share GPU resources. This container launches a synthetic workload that:

- Engages the GPU scheduler,
- Occupies a minimal subset of GPU resources (e.g., one warp),
- Performs no meaningful arithmetic or memory operations,
- Minimally impacts overall energy consumption.

The objective is to emulate GPU context activity and encourage time-sharing behaviors, without introducing measurable computational or energy load.

---

## Build Instructions

### Prerequisites

- Docker
- [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)
- NVIDIA GPU with driver and CUDA support (>=12.3 recommended)

### Build the Image

```bash
docker build -t cuda-noop .
```

### Run the image

```bash
docker run --rm --gpus all cuda-noop
```


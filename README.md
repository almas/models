# Dual RTX3090 NVLink Optimized Scripts

This directory contains optimized shell scripts for running large language models on dual RTX3090 24GB GPUs with NVLink support.

## Available Scripts

### `run-rtx3090-nvlink.sh`

An optimized run script specifically tuned for dual RTX3090 GPUs with NVLink:

- Enables NVLink-specific NCCL parameters
- Optimized memory utilization (95% GPU memory)
- Enhanced tensor parallelism configuration
- CPU affinity settings for NVLink communication
- Prefix caching for improved inference performance

## Key Optimizations for NVLink

The script includes specific configurations for optimal NVLink performance:

- `NCCL_IB_DISABLE=0` - Enables InfiniBand for NVLink
- `NCCL_SOCKET_IFNAME=eth0` - Specifies network interface for communication
- `NCCL_NET_GDR_LEVEL=3` - Enables GDR support for better performance
- `VLLM_ENABLE_MARLIN=1` - Enables Marlin quantization for better performance
- `distributed-execution-backend nccl` - Uses NCCL for efficient multi-GPU communication

## Usage

1. Update the `MODEL_PATH` variable to point to your model directory
2. Make the script executable: `chmod +x run-rtx3090-nvlink.sh`
3. Run the script: `./run-rtx3090-nvlink.sh`

## Hardware Requirements

- Dual NVIDIA RTX 3090 24GB GPUs
- NVLink connectivity between GPUs
- High-speed network interface (eth0 or appropriate interface)
- Sufficient system RAM (32GB+ recommended)

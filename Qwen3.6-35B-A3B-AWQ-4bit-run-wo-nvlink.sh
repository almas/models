#!/bin/bash

# Target local system CUDA paths if conda environment lacks full nvcc tooling
export CUDA_HOME=/usr/local/cuda
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH

# 1. CLASSIC DISTRIBUTED BACKEND FIX (For v0.32.0)
export VLLM_DISTRIBUTED_BACKEND=torch
export VLLM_WORKER_MULTIPROC_METHOD=spawn

# 2. FIX NCCL /DEV/SHM ALLOCATION CRASH 
export NCCL_CUMEM_HOST_ENABLE=0
export NCCL_IGNORE_CPU_AFFINITY=1

# Hardware Fallbacks for non-enterprise desktop topology
export NCCL_P2P_DISABLE=1
export NCCL_SHM_DISABLE=0
export NCCL_NET_GDR_LEVEL=0
export CUDA_DEVICE_ORDER=PCI_BUS_ID
export VLLM_ALLREDUCE_USE_SYMM_MEM=0

# Runtime Logging & Thread throttling
export NCCL_DEBUG=INFO
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1

vllm serve \
    --model Qwen3.6-35B-A3B-AWQ-4bit \
    --dtype auto \
    --tensor-parallel-size 2 \
    --generation-config vllm \
    --trust-remote-code \
    --host 0.0.0.0 \
    --port 8000 \
    --max-num-batched-tokens 8192 \
    --max-model-len 64072 \
    --max-num-seqs 64 \
    --kv-cache-dtype fp8 \
    --tool-call-parser qwen3_xml \
    --reasoning-parser qwen3 \
    --gpu-memory-utilization 0.8

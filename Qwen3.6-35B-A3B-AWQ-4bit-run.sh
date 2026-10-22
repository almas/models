#!/bin/bash

export OMP_NUM_THREADS=1 
# export VLLM_ALLREDUCE_USE_SYMM_MEM=0
export CUDA_HOME=$CONDA_PREFIX
export PATH=$CUDA_HOME/bin:$PATH

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
	# --enable-prefix-caching
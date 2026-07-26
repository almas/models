#!/bin/bash

# export VLLM_USE_MARLIN=1
export OMP_NUM_THREADS=1 
# export VLLM_ALLREDUCE_USE_SYMM_MEM=0

numactl --cpunodebind=0 --membind=0 python -m vllm.entrypoints.openai.api_server \
    --model Qwen3-Coder-Next-REAM-AWQ-4bit \
    --dtype auto \
    --tensor-parallel-size 2 \
    --generation-config vllm \
    --trust-remote-code \
    --host 0.0.0.0 \
    --port 8000 \
    --max-num-batched-tokens 8192 \
    --max-model-len 131072 \
    --max-num-seqs 64 \
    --kv-cache-dtype fp8 \
    --gpu-memory-utilization 0.90 \
    --enable-auto-tool-choice \
    --tool-call-parser qwen3_xml

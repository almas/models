#!/bin/bash

# export VLLM_USE_MARLIN=1

export OMP_NUM_THREADS=1 
export VLLM_ALLREDUCE_USE_SYMM_MEM=0

# vllm serve \
numactl --cpunodebind=0 --membind=0 python -m vllm.entrypoints.openai.api_server \
    --model ./cyankiwi-Qwen3-Coder-30B-A3B-Instruct-AWQ-4bit \
    --dtype auto \
    --tensor-parallel-size 2 \
	--generation-config vllm \
    --trust-remote-code \
    --host 0.0.0.0 \
    --port 8000 \
    --max_num_batched_tokens 8192 \
    --max_model_len 128000 \
    --max_num_seqs 190 \
    --kv-cache-dtype int8_per_token_head \
    --gpu_memory_utilization 0.90 \
    --enable-auto-tool-choice \
    --tool-call-parser qwen3_coder

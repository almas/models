#!/bin/bash

# export VLLM_USE_MARLIN=1
export OMP_NUM_THREADS=1 
export VLLM_ALLREDUCE_USE_SYMM_MEM=0

numactl --cpunodebind=0 --membind=0 python -m vllm.entrypoints.openai.api_server \
    --model ./model/gemma-4-31B-it-AWQ-4bit \
    --dtype auto \
    --tensor-parallel-size 2 \
	--generation-config vllm \
    --trust-remote-code \
    --host 0.0.0.0 \
    --port 8000 \
    --max_model_len 96000 \
    --kv-cache-dtype int8_per_token_head \
    --max_num_batched_tokens 2100 \
    --gpu_memory_utilization 0.95 \
	--enable-auto-tool-choice \
    --tool-call-parser gemma4 \
	-03

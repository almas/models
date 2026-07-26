#!/bin/bash

export VLLM_USE_MARLIN=1

vllm serve \
    --model llmfan46-Qwen3.6-35B-A3B-uncensored-heretic-GPTQ-Int4 \
    --dtype auto \
    --tensor-parallel-size 2 \
    --trust-remote-code \
    --host 0.0.0.0 \
    --port 8000 \
    --max_num_batched_tokens 2496 \
    --max_model_len 256000 \
    --max_num_seqs 190 \
    --kv-cache-dtype int8_per_token_head \
    --gpu_memory_utilization 0.90

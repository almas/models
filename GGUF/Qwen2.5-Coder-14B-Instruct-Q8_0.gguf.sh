#!/bin/bash

~/workspace/AI/llama.cpp/build/bin/llama-server \
    -m ~/workspace/AI/models/GGUF/Qwen2.5-Coder-14B-Instruct-Q8_0.gguf \
        -ngl all \
        -fa \
	--ctx-size 32000 \
	--parallel 1 \
	--port 8000 \
	--host 0.0.0.0 \
        --cont-batching

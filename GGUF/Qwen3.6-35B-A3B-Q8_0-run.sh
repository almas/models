#!/bin/bash

~/workspace/AI/llama.cpp/build/bin/llama-server     -m ~/workspace/AI/models/GGUF/Qwen3.6-35B-A3B-Q8_0.gguf    --n-gpu-layers 99     --tensor-split 1,1     --ctx-size 160680     --parallel 1     --port 8000     --host 0.0.0.0     --cont-batching

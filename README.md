# Dual RTX3090 NVLink Optimized Scripts

This directory contains optimized shell scripts for running large language models on dual RTX3090 24GB GPUs with NVLink support.

## Available Scripts

## Hardware Requirements

- Dual NVIDIA RTX 3090 24GB GPUs
- NVLink connectivity between GPUs
- High-speed network interface (eth0 or appropriate interface)
- Sufficient system RAM (32GB+ recommended)

## Preparation

```bash
conda create -n vllm_latest python=3.12 -y
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
conda activate vllm_latest
pip install vllm
conda install -c conda-forge gxx_linux-64 sysroot_linux-64
conda install -c nvidia cuda-toolkit
conda install -c conda-forge ninja
```

## Usage

```bash
conda activate vllm_latest

## Execute model load script. For Example:
./Qwen3.6-35B-A3B-AWQ-4bit-run.sh
```

#!/usr/bin/env bash
case "$1" in
  build_generator)
    docker build -t hw3-generator generator
    ;;
  run_generator)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" hw3-generator
    ;;
  create_local_data)
    python3 generator/generate.py local_data
    ;;
esac
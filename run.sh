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
  build_reporter)
    docker build -t hw3-reporter reporter
    ;;
  run_reporter)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" hw3-reporter
    ;;
  structure)
    ls -R
    ;;
  clear_data)
    rm -f data/*.csv data/*.html
    ;;
  inside_generator)
    docker run --rm -v "$(pwd)/data:/data" hw3-generator ls -la /data
    ;;
  inside_reporter)
    docker run --rm -v "$(pwd)/data:/data" hw3-reporter ls -la /data
    ;;
esac
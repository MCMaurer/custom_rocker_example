#!/bin/bash

docker build -t custom-rocker-example .

open http://localhost:8787

docker run -e PASSWORD="$1" -p 8787:8787 -v "$(pwd)"/output:/home/rstudio/output custom-rocker-example

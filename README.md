# hcf

A CPU-Fuzzer written in Bash/C

## Installation

 1. clone this repo
 2. `gcc -o executeopcode executeopcode.c`

## Usage

    ./hcf.sh [opcodes separated by spaces]

    ./hcf.sh 0xC3 0x90

The First OpCode has to be 0xC3 (ret)

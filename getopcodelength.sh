#!/bin/bash
echo $(ndisasm __tempopcode | awk '{print $2}' | wc -w)

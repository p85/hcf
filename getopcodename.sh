#!/bin/bash
ndisasm __tempopcode | cut -c 29-1024 | tr '\n' ','

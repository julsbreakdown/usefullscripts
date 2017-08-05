#!/bin/bash

MODEL=`cat /cpu/procinfo | grep "model name" | sort | uniq`
ALL=`cat /proc/cpuinfo | grep "bogo" | wc -l`
PHYSICAL=`cat /proc/cpuinfo | grep "physical id" | sort | uniq | wc -l`
CORES=`cat /proc/cpuinfo | grep "cpu cores" | sort | uniq | cut -d':' -f2`
PHY_CORES=$(($PHYSICAL * $CORES))
echo "Type $MODEL"
echo "Processors $PHYSICAL"
echo "Physical cores $PHY_CORES"
echo "Including hyperthreading cores $ALL"

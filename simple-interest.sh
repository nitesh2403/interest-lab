# !/usr/bin/env bash
# simple-interest.sh
# Usage: ./simple-interest.sh <principal> <rate> <time>
# Calculates simple interest and total amount.

set -euo pipefail

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <principal> <rate_percent> <time_years>"
  echo "Example: $0 1000 5 2"
  exit 1
fi

P=$1
R=$2
T=$3

# Validate numeric inputs
re='^[0-9]+([.][0-9]+)?$'
if ! [[ $P =~ $re ]] || ! [[ $R =~ $re ]] || ! [[ $T =~ $re ]]; then
  echo "Error: all inputs must be non-negative numbers."
  exit 1
fi

SI=$(awk -v p="$P" -v r="$R" -v t="$T" 'BEGIN{ printf "%.2f", (p*r*t)/100 }')
AMOUNT=$(awk -v p="$P" -v si="$SI" 'BEGIN{ printf "%.2f", p + si }')

echo "Principal: $P"
echo "Rate: $R"
echo "Time: $T"
echo "Simple Interest = $SI"
echo "Amount = $AMOUNT"

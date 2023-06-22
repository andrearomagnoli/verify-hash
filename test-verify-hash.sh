#!/bin/bash
# Test the verify-hash.sh with valid parameters
result=$(bash verify-hash.sh md5 file.txt 827ccb0eea8a706c4c34a16891f84e7b)
if [[ $result = *"OK: Keys match correctly."* ]]; then
  echo "Test 1: Passed"
else
  echo "Test 1: Failed"
fi

# Test the verify-hash.sh with invalid parameters
result=$(bash verify-hash.sh md5)
if [[ $result = *"Illegal parameters: run '$0 -h' for usage."* ]]; then
  echo "Test 2: Passed"
else
  echo "Test 2: Failed"
fi

# Test the verify-hash.sh with help command
result=$(bash verify-hash.sh -h)
if [[ $result = *"Usage: $0 <hash> <file> <given_key>"* ]]; then
  echo "Test 3: Passed"
else
  echo "Test 3: Failed"
fi

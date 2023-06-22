#!/bin/bash
# Test the verify-hash.sh with valid parameters
RED='\033[0;31m'
GREEN='\033[2;32m'
CLOSE='\033[m'
NC='\033[0m' # No Color
# echo -e "I ${RED}love${GREEN} Stack Overflow"

result=$(bash verify-hash.sh md5 LICENSE 86d3f3a95c324c9479bd8986968f4327)
if [[ $result = *"OK: Keys match correctly."* ]]; then
  echo -e "md5 test: ${GREEN}Passed${CLOSE}"
else
  echo -e "md5 test: ${RED}Failed${CLOSE}${CLOSE}"
fi

result=$(bash verify-hash.sh md5 LICENSE 12345)
if [[ $result = *"Failed: Keys don't match"* ]]; then
  echo -e "md5 mismatch test: ${GREEN}Passed${CLOSE}"
else
  echo -e "md5 mismatch test: ${RED}Failed${CLOSE}"
fi

result=$(bash verify-hash.sh sha256 LICENSE c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4)
if [[ $result = *"OK: Keys match correctly."* ]]; then
  echo -e "sha256 test: ${GREEN}Passed${CLOSE}"
else
  echo -e "sha256 test: ${RED}Failed${CLOSE}"
fi

result=$(bash verify-hash.sh sha256 LICENSE 123)
if [[ $result = *"Failed: Keys don't match"* ]]; then
  echo -e "sha256 mismatch test: ${GREEN}Passed${CLOSE}"
else
  echo -e "sha256 mismatch test: ${RED}Failed${CLOSE}"
fi

result=$(bash verify-hash.sh sha512 LICENSE dc6b68d13b8cf959644b935f1192b02c71aa7a5cf653bd43b4480fa89eec8d4d3f16a2278ec8c3b40ab1fdb233b3173a78fd83590d6f739e0c9e8ff56c282557)
if [[ $result = *"OK: Keys match correctly."* ]]; then
  echo -e "sha512 test: ${GREEN}Passed${CLOSE}"
else
  echo -e "sha512 test: ${RED}Failed${CLOSE}"
fi

result=$(bash verify-hash.sh sha512 LICENSE 12345)
if [[ $result = *"Failed: Keys don't match"* ]]; then
  echo -e "sha512 mismatch test: ${GREEN}Passed${CLOSE}"
else
  echo -e "sha512 mismatch test: ${RED}Failed${CLOSE}"
fi

# Test the verify-hash.sh with help command
result=$(bash verify-hash.sh -h)
if [[ $result = *"Usage: verify-hash.sh <hash> <file> <given_key>"* ]]; then
  echo -e "Help command test: ${GREEN}Passed${CLOSE}"
else
  echo -e "Help command test: ${RED}Failed${CLOSE}"
fi
#!/bin/bash
# Test the verify-hash.sh with valid parameters
result=$(bash verify-hash.sh md5 LICENSE 86d3f3a95c324c9479bd8986968f4327)
if [[ $result = *"OK: Keys match correctly."* ]]; then
  echo "md5 test: Passed"
else
  echo "md5 test: Failed"
fi

result=$(bash verify-hash.sh sha256 LICENSE c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4)
if [[ $result = *"OK: Keys match correctly."* ]]; then
  echo "sha256 test: Passed"
else
  echo "sha256 test: Failed"
fi

result=$(bash verify-hash.sh sha512 LICENSE dc6b68d13b8cf959644b935f1192b02c71aa7a5cf653bd43b4480fa89eec8d4d3f16a2278ec8c3b40ab1fdb233b3173a78fd83590d6f739e0c9e8ff56c282557)
if [[ $result = *"OK: Keys match correctly."* ]]; then
  echo "sha512 test: Passed"
else
  echo "sha512 test: Failed"
fi
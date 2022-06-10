#!/usr/bin/env bash
set -x
value=$(python3 -c "import urllib.parse; print(urllib.parse.quote('''$1'''))")
result=$(curl -XPOST --user "qiyang:11da1ffe73b995ea27bcaae89b2889b9b5" "http://127.0.0.1:8080/job/${input_job}/${input_build_number}/wfapi/inputSubmit?inputId=$2" -d "json=$value")

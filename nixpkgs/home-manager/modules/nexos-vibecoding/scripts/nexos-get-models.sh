#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

curl -Ls \
  --url "https://api.nexos.ai/v1/models" \
  --header "Authorization: Bearer ${NEXOS_API_KEY}" \
  --header 'Accept: */*' |
jq -r '.data[] | [.name, .nexos_model_id] | @tsv' | column -t -s $'\t'

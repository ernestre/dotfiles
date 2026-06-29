#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

HOST="api.nexos.ai"

curl -Ls \
  --url "https://${HOST}/v1/models" \
  --header "Authorization: Bearer ${NEXOS_API_KEY}" \
  --header 'Accept: */*' |
jq ".data[].name"

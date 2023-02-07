#!/usr/bin/env bash
eval "$(jq -r '@sh "DO_TOKEN=\(.do_token) KEY_BODY=\(.key_body)"')"

curl -X GET   -H "Content-Type: application/json"   -H "Authorization: Bearer $DO_TOKEN" \
"https://api.digitalocean.com/v2/account/keys?per_page=200" \
| jq -r --arg KEY_BODY "$KEY_BODY" \
'.ssh_keys[] | if .public_key == $KEY_BODY then {id : .id|tostring, name : .name, fingerprint : .fingerprint}  else empty end'
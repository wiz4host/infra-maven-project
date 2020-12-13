#!/bin/bash


cd ./terraform

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <path_to_content_directory> <organization>/<workspace>"
  exit 0
fi
CONTENT_DIRECTORY="$1"
ORG_NAME="$(cut -d'/' -f1 <<<"$2")"
WORKSPACE_NAME="$(cut -d'/' -f2 <<<"$2")"
BUILD_NUMBER=$3
TOKEN=$4
WORKSPACE_ID=$(cat ./workspace-BLD${BUILD_NUMBER}.id)




UPLOAD_FILE_NAME="./content-$(date +%s).tar.gz"
tar -zcvf "$UPLOAD_FILE_NAME" -C "$CONTENT_DIRECTORY" .



echo '{"data":{"type":"configuration-versions"}}' > ./create_config_version_BLD${BUILD_NUMBER}.json
UPLOAD_URL=($(curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @create_config_version.json \
  https://app.terraform.io/api/v2/workspaces/$WORKSPACE_ID/configuration-versions \
  | jq -r '.data.attributes."upload-url"'))


curl \
  --header "Content-Type: application/octet-stream" \
  --request PUT \
  --data-binary @"$UPLOAD_FILE_NAME" \
  $UPLOAD_URL


rm "$UPLOAD_FILE_NAME"
rm ./create_config_version.json
rm ./workspace-BLD${BUILD_NUMBER}.id
#!/bin/bash
read -p "What is the backend's base path? (Default: http://localhost) ";
BASE_PATH="${REPLY}"
if [ -z "$BASE_PATH" ]
then
    BASE_PATH="http://localhost";
fi

read -p "What is the backend's port? (Default: 5000) ";
PORT="${REPLY}"
if [ -z "$PORT" ]
then
    BASE_PATH="${BASE_PATH}:5000";
else
    BASE_PATH="${BASE_PATH}:${PORT}";
fi

ECHO "${BASE_PATH}"
npx @openapitools/openapi-generator-cli generate -g typescript-inversify -i $BASE_PATH/swagger/v1/swagger.json -o ./src/openapi --additional-properties=\"useRxJS6=true\"
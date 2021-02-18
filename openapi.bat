@echo off
SETLOCAL

set _BASE_PATH=""
set _PORT=""

set /p _BASE_PATH="What is the backend's base path? (Default: http://localhost) "
if "%_BASE_PATH%"=="""" (set _BASE_PATH=http://localhost)

set /p _PORT="What is the backend's port? (Default: 5000) "
if "%_PORT%"=="""" (set _BASE_PATH=%_BASE_PATH%:5000) else (set _BASE_PATH=%_BASE_PATH%:%_PORT%)

ECHO %_BASE_PATH%
npx @openapitools/openapi-generator-cli generate -g typescript-inversify -i %_BASE_PATH%/swagger/v1/swagger.json -o ./src/openapi --additional-properties=\"useRxJS6=true\"

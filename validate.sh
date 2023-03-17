# Validate json schemas recrusive in this directory
#
# When not in Github actions environment check if ajv is installed
if [ ! -n "$GITHUB_ACTIONS" ]; then
    if ! type "ajv" > /dev/null; then
        echo "ajv is not installed. Install with npm install -g ajv-cli"
        exit 1
    fi
fi

IFS='
'
set -f
for file in $(find . -type f  -name "*.json");
do
    ajv compile -s "$file"
done
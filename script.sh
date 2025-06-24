#!/bin/bash
echo '[' > matrix.json

if [ -z "$CI_COMMIT_BEFORE_SHA" ]; then
  echo "🟡 No previous commit SHA found. Including all apps/environments..."
  find apps -mindepth 2 -maxdepth 2 -type d | while read -r path; do
    app=$(basename "$(dirname "$path")")
    env=$(basename "$path")
    echo "  { \"APP\": \"$app\", \"ENV\": \"$env\" }," >> matrix.json
  done
else
  echo "🟢 Changes detected between commits. Generating delta-based matrix..."
  git diff --name-only "$CI_COMMIT_BEFORE_SHA" "$CI_COMMIT_SHA" |
    grep '^apps/' |
    cut -d'/' -f2,3 |
    sort -u |
    while IFS='/' read -r app env; do
      echo "  { \"APP\": \"$app\", \"ENV\": \"$env\" }," >> matrix.json
    done
fi

sed -i '$ s/,$//' matrix.json
echo ']' >> matrix.json

echo "🔧 Final matrix:"
cat matrix.json
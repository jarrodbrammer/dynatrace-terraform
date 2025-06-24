#!/bin/bash
echo '[' > matrix.json

# Determine SHAs safely for diff
BEFORE_SHA=${CI_COMMIT_BEFORE_SHA:-"$(git rev-list --max-parents=0 HEAD)"}
AFTER_SHA=${CI_COMMIT_SHA:-"HEAD"}

echo "🔍 Detecting changes between $BEFORE_SHA and $AFTER_SHA..."

# Capture changed app/env paths
CHANGES=$(git diff --name-only "$BEFORE_SHA" "$AFTER_SHA" | grep '^apps/' | cut -d'/' -f2,3 | sort -u)

if [ -z "$CHANGES" ]; then
  echo "⚠️  No changes detected or no diff SHA available. Falling back to ALL apps/environments..."
  find apps -mindepth 2 -maxdepth 2 -type d | while read -r path; do
    app=$(basename "$(dirname "$path")")
    env=$(basename "$path")
    echo "  { \"APP\": \"$app\", \"ENV\": \"$env\" }," >> matrix.json
  done
else
  echo "✅ Found changes in the following app/env folders:"
  echo "$CHANGES"
  echo "$CHANGES" | while IFS='/' read -r app env; do
    echo "  { \"APP\": \"$app\", \"ENV\": \"$env\" }," >> matrix.json
  done
fi

# Remove trailing comma and close JSON
sed -i '$ s/,$//' matrix.json
echo ']' >> matrix.json

echo "🔧 Final matrix:"
cat matrix.json

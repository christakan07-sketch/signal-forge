# CI Setup Instructions

## Why it couldn't be auto-pushed
The CI workflow file `.github/workflows/validate.yml` requires GitHub token with `workflow` scope.

## How to add it manually
1. Go to: https://github.com/christakan07-sketch/signal-forge/settings
2. Click "Actions" in the left sidebar
3. Create a new workflow or upload the file

## Or from GitHub web
1. Go to the repo page
2. Click "Add file" > "Create new file"
3. Path: `.github/workflows/validate.yml`
4. Paste the content from below

## Workflow content
```yaml
name: Validate Signal Forge

on:
  push:
    branches: [master]
  pull_request:
    branches: [master]

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Check JSON files are valid
        run: |
          find . -name "*.json" -not -path "./.git/*" | while read f; do
            echo "Checking $f"
            python3 -c "import json; json.load(open('$f'))" || exit 1
          done

      - name: Check required docs exist
        run: |
          required_files=(
            "README.md"
            "market-intel-system-overview.md"
            "market-intel-usage-guide.md"
            "market-intel-daily-workflow.md"
            "market-intel-team.md"
            "market-intel-handoff.md"
            "market-intel-policies.md"
            "simulation-framework/README.md"
            "simulation-framework/naming-conventions.md"
            "case-library/README.md"
            "case-library/taxonomy/event-types.md"
            "case-library/taxonomy/decision-ladder.md"
          )
          for f in "${required_files[@]}"; do
            if [ ! -f "$f" ]; then
              echo "MISSING: $f"
              exit 1
            fi
          done
          echo "All required files present"

      - name: Check naming conventions compliance
        run: |
          cd raw-events
          for f in $(ls *.json 2>/dev/null); do
            echo "$f" | grep -qE "^event-[0-9]{4}-[0-9]{2}-[0-9]{3}\.json$" || { echo "Bad raw-event name: $f"; exit 1; }
          done
          echo "Naming conventions OK"
```

## Branch protection rules
To set up:
1. Go to repo Settings > Branches
2. Click "Add rule" for branch `master`
3. Enable:
   - Require pull request reviews before merging
   - Require status checks to pass before merging
   - Select the "validate" check from Actions
4. Save

## What the CI does
- validates JSON syntax
- ensures required documentation files exist
- checks naming conventions for raw-event files

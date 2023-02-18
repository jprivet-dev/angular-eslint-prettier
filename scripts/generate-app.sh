#!/usr/bin/env bash

# Usage:
# $ . scripts/generate-app.sh

ng new app --create-application false --force
cd app
ng add @angular-eslint/schematics
ng generate @angular-eslint/schematics:application app --project-root --routing --style scss --strict
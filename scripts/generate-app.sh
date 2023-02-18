#!/usr/bin/env bash

# Usage:
# $ . scripts/generate-app.sh

echo "> Remove the old Angular app"
rm -rf app

echo "> Generate an empty Angular workspace"
ng new app --create-application false --defaults
cd app

echo "> Install ESLint"
ng add @angular-eslint/schematics

echo "> Generate a new Angular app in the workspace using ESLint"
ng generate @angular-eslint/schematics:application app --project-root --defaults --routing --style scss --strict
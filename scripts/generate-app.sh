#!/usr/bin/env bash

# Usage:
# $ . scripts/generate-app.sh

echo "######################################################"
echo "# Generate a new Angular app using ESlint & Prettier #"
echo "######################################################"

echo "> Remove the old Angular app"
rm -rf app

echo "> Generate an empty Angular workspace"
ng new app --create-application false --defaults
cd app

echo "> Install ESLint"
ng add @angular-eslint/schematics

echo "> Generate a new Angular app in the workspace using ESLint"
ng generate @angular-eslint/schematics:application app --project-root --defaults --routing --style scss --strict

echo "> Install Prettier locally"
npm install --save-dev --save-exact prettier

echo "> Create an empty config file"
echo {}> .prettierrc.json
cp .gitignore .prettierignore

echo "> Format all files with Prettier"
npx prettier --write .
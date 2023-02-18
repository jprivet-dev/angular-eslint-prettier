#!/usr/bin/env bash

# Usage:
# $ . scripts/generate-root.sh

echo "####################################################################################"
echo "# Generate (in root) a new Angular app using directly ESlint schematics & Prettier #"
echo "####################################################################################"

echo "> Generate (in root) an empty Angular workspace"
ng new app --directory ./ --create-application false --defaults

echo "> Install ESLint"
ng add @angular-eslint/schematics

echo "> Generate a new Angular app in the workspace using ESLint"
ng generate @angular-eslint/schematics:application app --project-root --routing --style scss --defaults --strict

echo "> Install Prettier locally"
npm install --save-dev --save-exact prettier

echo "> Create an empty config file"
echo {} >.prettierrc.json
cp .gitignore .prettierignore

echo "> Format all files with Prettier"
npx prettier --write .

echo "> Builds and serves your application with \"$ ng serve\""

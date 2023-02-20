#!/usr/bin/env bash

# Usage:
# $ . scripts/generate-app.sh

echo "##############################################################################"
echo "# Generate a new Angular app using directly ESlint schematics & use Prettier #"
echo "##############################################################################"

echo "> Remove the old Angular app"
[[ -d app ]] && rm -rf app

echo "> Generate an empty Angular workspace"
ng new app --create-application false --defaults
cd app

echo "> Install ESLint"
ng add @angular-eslint/schematics

echo "> Generate a new Angular app in the workspace using ESLint"
ng generate @angular-eslint/schematics:application app --project-root --routing --style scss --defaults --strict

echo "> Avoid error in StackBlitz"
line="import 'zone.js/dist/zone'; // Avoid error in StackBlitz"
sed  -i "1i ${line}" ./src/main.ts

echo "> Install Prettier locally"
npm install --save-dev --save-exact prettier

echo "> Create an empty config file"
echo {} >.prettierrc.json
cp .gitignore .prettierignore

echo "> Format all files with Prettier"
npx prettier --write .

echo "> Builds and serves your application with \"$ ng serve\""

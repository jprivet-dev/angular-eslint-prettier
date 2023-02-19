#!/usr/bin/env bash

# Usage:
# $ . scripts/convert-app.sh

echo "###########################################################################"
echo "# Create an original Angular app, convert TSLint to ESlint & use Prettier #"
echo "###########################################################################"

echo "> Remove the old Angular app"
[[ -d app ]] && rm -rf app

echo "> Create an Angular app"
ng new app --skip-git true --routing --style scss --defaults --strict
cd app

echo "> Install ESLint"
ng add @angular-eslint/schematics

echo "> Convert TSLint to ESlint"
echo {} >tslint.json
ng g @angular-eslint/schematics:convert-tslint-to-eslint

echo "> Install Prettier locally"
npm install --save-dev --save-exact prettier

echo "> Create an empty config file"
echo {} >.prettierrc.json
cp .gitignore .prettierignore

echo "> Format all files with Prettier"
npx prettier --write .

echo "> Builds and serves your application with \"$ ng serve\""

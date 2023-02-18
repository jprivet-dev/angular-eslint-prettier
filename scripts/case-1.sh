#!/usr/bin/env bash

# Usage:
# $ . scripts/case-1.sh

#ng new app --skip-git true --style scss --defaults --strict
ng new app --create-application false
cd app
ng add @angular-eslint/schematics
ng generate @angular-eslint/schematics:application app --project-root --routing --style scss --strict
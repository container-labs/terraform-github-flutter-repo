---
###########################
###########################
## Linter GitHub Actions ##
###########################
###########################
name: Lint Code Base

#
# Documentation:
# https://help.github.com/en/articles/workflow-syntax-for-github-actions
#

#############################
# Start the job on all push #
#############################
on:
  # push:
    #branches-ignore: [main]
    # Remove the line above to run when pushing to master
  pull_request:
    branches: [main]

###############
# Set the Job #
###############
jobs:
  build:
    # Name the Job
    name: Lint Code Base
    # Set the agent to run on
    runs-on: ubuntu-latest

    ##################
    # Load all steps #
    ##################
    steps:
      ##########################
      # Checkout the code base #
      ##########################
      - name: Checkout Code
        uses: actions/checkout@v2
        with:
          # Full git history is needed to get a proper list of changed files within `super-linter`
          fetch-depth: 0

      ################################################
      # Clone Flutter repository with stable channel #
      ################################################
      # Set up Flutter.
      - name: Clone Flutter repository with stable channel
        uses: subosito/flutter-action@v1.5.0
        with:
          channel: stable
      - run: flutter doctor -v

      ##########################
      # Flutter analyze & test #
      ##########################
      - run: cp .env.sample .env
      - name: Install dependencies
        run: flutter pub get

      - name: Analyze project source
        run: flutter analyze

      - name: Run tests
        run: flutter test

      ################################
      # Run Linter against code base #
      ################################
      - name: Lint Code Base
        uses: github/super-linter@v3
        env:
          VALIDATE_ALL_CODEBASE: false
          DEFAULT_BRANCH: main
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          FILTER_REGEX_EXCLUDE: ".*dart|.*/fastlane/.*|/.vscode/.*|.*cs||.*proto"

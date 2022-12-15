#!/bin/bash
echo '::group::🐶 Fetching changed files'
file_name=$(git diff master HEAD --name-only -- `find . -name '*.rb'`| tr '\n' ' ') # change `master` to your main branch (important!)
echo '::endgroup::'

echo '::group:: Running rubocop with reviewdog 🐶 ...'
rubocop $file_name --require /opt/rdjson_formatter.rb --format RdjsonFormatter \
  | reviewdog \
    -f=rdjson \
    -reporter="gitlab-mr-discussion" \
    -filter-mode="added" \
    -fail-on-error=false \

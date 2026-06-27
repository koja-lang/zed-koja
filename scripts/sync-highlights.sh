#!/usr/bin/env bash
# Refresh languages/koja/highlights.scm from the canonical copy in the
# tree-sitter-koja grammar repo, pinned to the same commit Zed builds against.
#
# The grammar repo is the source of truth for highlight queries; the other
# query files in languages/koja/ are Zed-specific and maintained locally.
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
manifest="$repo_root/extension.toml"
dest="$repo_root/languages/koja/highlights.scm"

# Pull the pinned grammar repo + commit out of [grammars.koja] in extension.toml.
repository="$(sed -n 's/^repository[[:space:]]*=[[:space:]]*"\(.*\)"/\1/p' "$manifest" | head -n1)"
commit="$(sed -n 's/^commit[[:space:]]*=[[:space:]]*"\(.*\)"/\1/p' "$manifest" | head -n1)"

if [[ -z "$repository" || -z "$commit" ]]; then
  echo "error: could not read grammar repository/commit from $manifest" >&2
  exit 1
fi

slug="${repository#https://github.com/}"
slug="${slug%.git}"
url="https://raw.githubusercontent.com/$slug/$commit/queries/highlights.scm"

echo "Fetching $url"
curl --fail --location --silent --show-error "$url" -o "$dest"
echo "Updated $dest"

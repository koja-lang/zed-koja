# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2026-07-10

### Changed

- Updated to tree-sitter-koja 0.2.0, adding support for `priv` on `struct`, `enum`, `const`, `type`, and `protocol` declarations, leading `and`/`or` line continuations, and dotted nested-type names.

### Fixed

- Comments are now highlighted.
- The outline panel shows the `priv` modifier on private declarations.

## [0.1.0] - 2026-06-27

Initial release.

[0.2.0]: https://github.com/koja-lang/zed-koja/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/koja-lang/zed-koja/releases/tag/v0.1.0

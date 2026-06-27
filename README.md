# zed-koja

A [Zed](https://zed.dev) extension for the [Koja programming language](https://github.com/koja-lang/koja).

## Getting started

**1. Install the language server.** The extension looks up `koja-lsp` on your `$PATH`.

- Installed Koja with [asdf](https://github.com/koja-lang/asdf-koja)? You already have it — every install ships `koja-lsp` alongside the `koja` compiler (version-matched) on your `$PATH`. Nothing else to do.
- Building Koja from source instead? Install the server from the [Koja workspace](https://github.com/koja-lang/koja):

  ```sh
  cargo install --path crates/koja-lsp
  ```

- Or point Zed at a specific binary in your settings:

  ```json
  {
    "lsp": {
      "koja-lsp": {
        "binary": { "path": "/absolute/path/to/koja-lsp" }
      }
    }
  }
  ```

**2. Install the extension.** It isn't in Zed's extension registry yet, so install it locally: clone this repository, then open the command palette in Zed and run **`zed: install dev extension`**, selecting the clone. Zed compiles the extension to WASM and fetches the grammar from the pinned commit in `extension.toml`.

## Contributing

Repository layout:

- `extension.toml` — extension manifest; pins the tree-sitter grammar to a `tree-sitter-koja` commit, so the grammar is **not** vendored here.
- `src/lib.rs` — the WASM entry point; wires up the `koja-lsp` language server.
- `languages/koja/` — Zed language config and tree-sitter queries (`highlights`, `indents`, `outline`, `injections`, `brackets`).

Reload local changes by re-running **`zed: install dev extension`**. Build outputs (`target/`, `grammars/`, `extension.wasm`) are gitignored.

### Updating the grammar

Bump the `commit` under `[grammars.koja]` in `extension.toml` to a newer [`tree-sitter-koja`](https://github.com/koja-lang/tree-sitter-koja) revision, then refresh the highlights copy from that revision:

```sh
./scripts/sync-highlights.sh
```

`languages/koja/highlights.scm` is a synced copy of the canonical [`tree-sitter-koja/queries/highlights.scm`](https://github.com/koja-lang/tree-sitter-koja/blob/main/queries/highlights.scm) — treat the grammar repo as the source of truth. The other query files (`indents`, `outline`, `injections`, `brackets`) are Zed-specific and maintained here.

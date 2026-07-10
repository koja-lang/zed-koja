; Outline (symbol tree) used by Zed's outline panel and breadcrumbs.

(struct_declaration
  "priv"? @context
  "struct" @context
  name: (_) @name) @item

(enum_declaration
  "priv"? @context
  "enum" @context
  name: (_) @name) @item

(enum_variant
  name: (_) @name) @item

(protocol_declaration
  "priv"? @context
  "protocol" @context
  name: (_) @name) @item

(impl_block
  "impl" @context
  target: (_) @name) @item

(extend_block
  "extend" @context
  target: (_) @name) @item

(function_declaration
  "fn" @context
  name: (_) @name) @item

(priv_function
  "priv" @context
  "fn" @context
  name: (_) @name) @item

(extern_function_declaration
  "fn" @context
  name: (_) @name) @item

(protocol_method
  "fn" @context
  name: (_) @name) @item

(const_declaration
  "priv"? @context
  "const" @context
  name: (_) @name) @item

(type_alias_declaration
  "priv"? @context
  "type" @context
  name: (_) @name) @item

(alias_declaration
  "alias" @context
  path: (_) @name) @item

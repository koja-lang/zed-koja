; Auto-indent rules.
;
; Each pattern pairs a container node (`@indent`) with its closing
; delimiter (`@end`) in the SAME match: lines between the opener and the
; `@end` token are indented one level, and the closing token dedents back
; to the opener's line. A bare `@end` with no `@indent` in the match does
; nothing, which is why the delimiter must be captured inside the node.

; `end`-terminated constructs: fn / if / unless / match / cond / for /
; while / loop / receive / struct / enum / protocol / impl / extend.
; `block` itself does not contain `end` — the parent construct does.
(_ "end" @end) @indent

; Parenthesised, bracketed, and braced constructs (parameters,
; argument_list, list, map, struct_construction, enum_construction, ...).
(_ "(" ")" @end) @indent
(_ "[" "]" @end) @indent
(_ "{" "}" @end) @indent
(_ "<<" ">>" @end) @indent

; Angle-bracketed type argument / parameter lists. Matched by node type
; so `<` / `>` comparison operators are never treated as indents.
(type_arguments ">" @end) @indent
(type_parameters ">" @end) @indent

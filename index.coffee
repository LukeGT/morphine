strip_comments = ///
  // .* $
  |
  /\* [\s\S]*? \*/
///mg
function_argumens = ///
  ^ function \s* [^\(]* \( \s* ( [^\)]* ) \)
///m
argument_split = /,/
argument = ///
  ^ \s* ( \S+ ) \s* $
///

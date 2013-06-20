stripComments = ///
  // .* $           # Single line comment
  |
  /\* [\s\S]*? \*/  # Multi-line comment
///mg
functionArgumens = ///
  ^ function \s* [^\(]* \(  # Function declaration
    \s* ( [^\)]* )          # arguments
  \)
///m
argumentSplit = /,/
argument = ///
  ^ \s* ( \S+ ) \s* $
///

exports.getArguments = (func) ->
  
  funcString = func.toString().replace stripComments, ''
  argString = funcString.match(functionArgumens)[1]
  if argString.length
    args = argString.split(argumentSplit).map (arg) ->
      arg.match(argument)[1]
    return args
  else
    return []

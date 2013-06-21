morphine = require '../index'

toFunction = (string) ->
  (new Function "return #{string}")()

blankFunction = toFunction "function(){}"
blankFunctionWithName = toFunction "function blank(){}"
normalFunction = toFunction "function(arg1, arg2, arg3) { console.log(arguments); }"
strangeNameArguments = toFunction "function strange( $ometh1ing, ಠ_ಠ, __32423__, ʺunicode quoteʺ) {}"
trollFunction = toFunction """function lawls(  \tone\t, two,/*(lol*lol)*/three, four
//kek
, \tfive  /***/
// LULZ
/*
//MAD BRO!?!
*/
//)
) {console.log(one, two, three, four, five);}"""

console.log morphine.getArguments blankFunction
console.log morphine.getArguments blankFunctionWithName
console.log morphine.getArguments normalFunction
console.log morphine.getArguments strangeNameArguments
console.log morphine.getArguments trollFunction

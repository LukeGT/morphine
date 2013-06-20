morphine = require '../index'

troll_function = (new Function """return function lawls(  one, two,/*(lol*lol)*/three, four
//kek
, five  /***/
// LULZ
/*
//MAD BRO!?!
*/
//
) {console.log(one, two, three, four, five);}""")()

console.log morphine.getArguments troll_function

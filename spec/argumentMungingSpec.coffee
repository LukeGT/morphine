morphine = require '../index'


describe "Argument munging", ->

  toFunction = null
  checkArgs = null

  beforeEach ->
    toFunction = (string) ->
      (new Function "return #{string}")()

    checkArgs = (actual, expected) ->

      expect(actual.length).toBe expected.length

      for i, a in expected
        expect(actual[i]).toBe a

  it "works on a blank function", ->

    func = toFunction "function(){}"
    args = morphine.getArguments func

    checkArgs args, []

  it "works on a named blank function", ->

    func = toFunction "function blank(){}"
    args = morphine.getArguments func

    checkArgs args, []

  it "works on a strangely named blank function", ->
    
    # Needs to be implemented
  
  it "works on a normal looking function", ->
    
    func = toFunction "function(arg1, arg2, arg3) { console.log(arguments); }"
    args = morphine.getArguments func

    checkArgs args, [ "arg1", "arg2", "arg3" ]

  it "works on a function with strange argument names", ->

    func = toFunction "function strange( $ometh1ing, ಠ_ಠ, __32423__, ʺunicode quoteʺ) {}"
    args = morphine.getArguments func

    checkArgs args, [ "$ometh1ing", "ಠ_ಠ", "__32423__", "ʺunicode quoteʺ" ]

  it "works on a function with many comments and gotchas", ->
    
    func = toFunction """function lawls(  \tone\t, two,/*(lol*lol)*/three, four
      //kek
      , \tfive  /***/
      // LULZ
      /*
      //MAD BRO!?!
      */
      //)
      ) {console.log(one, two, three, four, five);}"""
    args = morphine.getArguments func

    checkArgs args, [ "one", "two", "three", "four", "five" ]

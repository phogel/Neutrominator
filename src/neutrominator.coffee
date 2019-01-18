
class Neutrominator

  tagNames = ['h1','h2','h3','h4','h5','p']
  languagePrefixes = ['Pol','Russ','Schwed','Finn','Dän','Lett','Türk','Portugies']
  haystack = null

  constructor: (@doStrict = true) ->
    #console.log 'workit baby, ' + @doStrict

  cleanText: ->
    for tagName in tagNames
      if document.getElementsByTagName(tagName).length > 0
        for element in document.getElementsByTagName(tagName)
          @haystack = element
          if @doStrict then @parseAndRewriteStrict() else @parseAndRewrite()

  parseAndRewrite: ->
    @replaceIt /[\*_]innen/g, "Innen"
    @defaultRewrite()

  parseAndRewriteStrict: ->
    for lang in languagePrefixes
      @replaceIt new RegExp( lang + "[\*_]innen", "g" ), lang + "en"

    @replaceIt /(\sd|D)en ([a-zA-ZßäöüÄÖÜ]*)en ([a-zA-ZßäöüÄÖÜ]*)er[\*_]innen([a-zßäöü])/g, "$1en $2en $3er$4"
    @replaceIt /(\sd|D)en ([a-zA-ZßäöüÄÖÜ]*)en ([a-zA-ZßäöüÄÖÜ]*)er[\*_]innen/g, "$1en $2en $3ern"
    @replaceIt /(\sd|D)en ([a-zA-ZßäöüÄÖÜ]*)en ([a-zA-ZßäöüÄÖÜ\s]*)r[\*_]innen/g, "$1en $2en $3ren"
    @replaceIt /on ([a-zA-ZßäöüÄÖÜ]*)er[\*_]innen/g, "on $1ern"
    @replaceIt /on ([a-zA-ZßäöüÄÖÜ]*)r[\*_]innen/g, "on $1ren"
    @replaceIt /die ([a-zA-ZßäöüÄÖÜ]*)en ([a-zA-ZßäöüÄÖÜ]*)er[\*_]innen/g, "die $1en $2er"
    @replaceIt /(\sd|D)en ([a-zA-ZäöüÄÖÜ]*)er[\*_]innen/g, "$1en $2ern"
    @replaceIt /or[\*_]innen/g, "oren"
    @replaceIt /er[\*_]innen/g, "er"
    @replaceIt /([gt])[\*_]innen/g, "$1en"
    @replaceIt /(\sd|D)en ([a-zA-ZäöüÄÖÜ]*)[\*_]innen/g, "$1en $2en"
    @replaceIt /Freund[\*_]innen/g, "Freunde"
    @replaceIt /Herr[\*_]innen/g, "Herren"
    @replaceIt /d[\*_]innen/g, "den"
    @replaceIt /r[\*_]innen/g, "re"
    @replaceIt /f[\*_]innen/g, "fs"
    @replaceIt /[\*_]innen/g, ""
    @replaceIt /e[\*_]r/g, "er"
    @replaceIt /(\se|E)ine[\*_]r /g, "einer "
    @defaultRewrite()

  replaceIt: (needle, term) -> 
    @haystack.innerHTML = @haystack.innerHTML.replace needle,term

  defaultRewrite: () ->
    @replaceIt /[\*_]in([ ,.])/g, "$1"
    @replaceIt /[\*_]n([ ,.])/g, "n$1"
    @replaceIt /Studierenden/g, "Studenten"
    @replaceIt /([eine|die]) Studierende/g, "$1 Studentin"
    @replaceIt /Studierende/g, "Studenten"
    @replaceIt /Studierender/g, "Student"
    @replaceIt /(\sd|D)er[\*_]diejenige/g, "$1erjenige"
    @replaceIt /(\sd|D)ie[\*_]derjenige/g, "$1erjenige"
    @replaceIt /(\se|E)ine[\*_]r /g, "$1iner "
    @replaceIt /([eE])in[\*_]e /g, "$1ine "
    @replaceIt /([sS])eine[\*_]ihre/g, "$1eine"
    @replaceIt /ihre[\*_]seine/g, "seine"
    @replaceIt /Ihre[\*_]seine/g, "Seine"
    @replaceIt /einen[\*_]ihren/g, "einen"
    @replaceIt /eines[\*_]r /g, "eines "
    
  getDativ: (noun) ->
    noun = noun.replace /ler[\*_]innen/g, "lern"
    noun = noun.replace /er[\*_]innen/g, "ern"
    noun = noun.replace /r[\*_]innen/g, "rn"
    noun = noun.replace /[\*_]innen/g, "n"
    noun

module.exports = Neutrominator

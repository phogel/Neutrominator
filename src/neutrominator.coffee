
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
          if @doStrict
            @parseAndRewriteStrict()
          else
            @parseAndRewrite()

  parseAndRewrite: ->
    @replaceIt /[\*_]innen/g, "Innen"
    @defaultRewrite()

  parseAndRewriteStrict: ->
    for lang in languagePrefixes
      @replaceIt new RegExp( lang + "[\*_]innen", "g" ), lang + "en"
    @replaceIt /den ([a-zA-Z]*)en ([a-zA-Z]*)er[\*_]innen([a-z])/g, "den $1en $2er$3"
    @replaceIt /den ([a-zA-Z]*)en ([a-zA-Z]*)er[\*_]innen/g, "den $1en $2ern"
    @replaceIt /den ([a-zA-Z]*)en ([\s\S]*)r[\*_]innen/g, "den $1en $2ren"
    @replaceIt /die ([a-zA-Z]*)en ([a-zA-Z]*)er[\*_]innen/g, "die $1en $2er"
    @replaceIt /den ([a-zA-Z]*)er[\*_]innen/g, "den $1ern"
    @replaceIt /or[\*_]innen/g, "oren"
    @replaceIt /er[\*_]innen/g, "er"
    @replaceIt /([gtd])[\*_]innen/g, "$1en"
    @replaceIt /r[\*_]innen/g, "re"
    @replaceIt /f[\*_]innen/g, "fs"
    @replaceIt /[\*_]innen/g, ""
    @replaceIt /e[\*_]r/g, "er"
    @defaultRewrite()

  defaultRewrite: () ->
    @replaceIt /[\*_]in([ ,.])/g, "$1"
    @replaceIt /[\*_]n([ ,.])/g, "n$1"
    @replaceIt /Studierenden/g, "Studenten"
    @replaceIt /Studierende/g, "Studentin"
    @replaceIt /Studierender/g, "Student"

  replaceIt: (needle, term) ->
    @haystack.innerHTML = @haystack.innerHTML.replace needle,term

  getDativ: (noun) ->
    noun = noun.replace /ler[\*_]innen/g, "lern"
    noun = noun.replace /er[\*_]innen/g, "ern"
    noun = noun.replace /r[\*_]innen/g, "rn"
    noun = noun.replace /[\*_]innen/g, "n"
    noun

module.exports = Neutrominator

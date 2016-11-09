
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
    @replaceIt /en ([a-zA-Z]*)er[\*_]innen/g, "en $1ern"
    @replaceIt /or[\*_]innen/g, "oren"
    @replaceIt /er[\*_]innen/g, "er"
    @replaceIt /t[\*_]innen/g, "ten"
    @replaceIt /[\*_]innen/g, ""
    @defaultRewrite()

  defaultRewrite: () ->
    @replaceIt /[\*_]in([ ,.])/g, "$1"
    @replaceIt /[\*_]n([ ,.])/g, "n$1"
    @replaceIt /Studierenden/g, "Studenten"
    @replaceIt /Studierende/g, "Studentin"
    @replaceIt /Studierender/g, "Student"

  replaceIt: (needle, term) ->
    @haystack.innerHTML = @haystack.innerHTML.replace needle,term

module.exports = Neutrominator

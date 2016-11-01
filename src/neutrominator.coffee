
class Neutrominator

  tagNames = ['h1','h2','h3','h4','h5','p']

  constructor: (@doStrict = true) ->
    console.log 'workit baby, ' + @doStrict

  cleanText: ->
    for tagName in tagNames
      if document.getElementsByTagName(tagName).length > 0
        for element in document.getElementsByTagName(tagName)
          if @doStrict
            @parseAndRewriteStrict element
          else
            @parseAndRewrite element

  parseAndRewrite: (content) ->
    @replaceIt content, /\*innen/g, "Innen"
    @replaceIt content, /\_innen/g, "Innen"
    @defaultRewrite content

  parseAndRewriteStrict: (content) ->
    @replaceIt content, /en ([a-zA-Z]*)er\*innen/g, "en $1ern"
    @replaceIt content, /en ([a-zA-Z]*)er_innen/g, "en $1ern"
    @replaceIt content, /or\*innen/g, "oren"
    @replaceIt content, /er\*innen/g, "er"
    @replaceIt content, /t\*innen/g, "ten"
    @replaceIt content, /or_innen/g, "oren"
    @replaceIt content, /er_innen/g, "er"
    @replaceIt content, /t\_innen/g, "ten"
    @replaceIt content, /\*innen/g, ""
    @replaceIt content, /_innen/g, ""
    @defaultRewrite content

  defaultRewrite: (content) ->
    @replaceIt(content, /\*in /g, " ")
    @replaceIt(content, /\_in /g, " ")
    @replaceIt(content, /\*n /g, "n ")
    @replaceIt(content, /\_n /g, "n ")
    @replaceIt(content, /Studierenden/g, "Studenten")
    @replaceIt(content, /Studierende/g, "Studentin")
    @replaceIt(content, /Studierender/g, "Student")

  replaceIt: (haystack, needle, term) ->
   haystack.textContent = haystack.textContent.replace needle,term

module.exports = Neutrominator

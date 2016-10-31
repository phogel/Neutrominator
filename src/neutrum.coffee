
class Neutrominator

  tagNames = ['h1','h2','h3','h4','h5','p']


  constructor: ->
    console.log('Neutrominator geladen')

  cleanText: ->
    for tagName in tagNames
      if document.getElementsByTagName(tagName).length > 0
        for element in document.getElementsByTagName(tagName)
          @parseAndRewrite element

  parseAndRewrite: (content) ->
    @replaceIt content, /\*innen/, "Innen"
    @replaceIt content, /\_innen/, "Innen"
    @defaultRewrite content

  parseAndRewriteStrict: (content) ->
    @replaceIt content, /or\*innen/, "oren"
    @replaceIt content, /er\*innen/, "er"
    @defaultRewrite content

  defaultRewrite: (content) ->
    @replaceIt(content, /\*in /, " ")
    @replaceIt(content, /\*n /, "n ")
    @replaceIt(content, /Studierenden/, "Studenten")
    @replaceIt(content, /Studierende/, "Studentin")
    @replaceIt(content, /Studierender/, "Student")

  replaceIt: (haystack, needle, term) ->
    while haystack.innerText.match(needle)
      haystack.innerText = haystack.innerText.replace(needle,term)

window.cleanser = new Neutrominator()
window.onload = ->
  window.cleanser.cleanText()

module.exports = Neutrominator

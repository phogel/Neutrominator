
class Neutrominator

  tagNames = ['h1','h2','h3','h4','h5','p']

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
    @replaceIt content, /en ([a-zA-Z]*)er\*innen/g, "en $1ern"
    @replaceIt content, /en ([a-zA-Z]*)er_innen/g, "en $1ern"
    @replaceIt content, /or\*innen/g, "oren"
    @replaceIt content, /er\*innen/g, "er"
    @replaceIt content, /or_innen/g, "oren"
    @replaceIt content, /er_innen/g, "er"
    @replaceIt content, /\*innen/g, ""
    @replaceIt content, /_innen/g, ""
    @defaultRewrite content

  defaultRewrite: (content) ->
    @replaceIt(content, /\*in /g, " ")
    @replaceIt(content, /\*n /g, "n ")
    @replaceIt(content, /Studierenden/g, "Studenten")
    @replaceIt(content, /Studierende/g, "Studentin")
    @replaceIt(content, /Studierender/g, "Student")

  replaceIt: (haystack, needle, term) ->
   haystack.innerText = haystack.innerText.replace needle,term

window.cleanser = new Neutrominator()
window.onload = ->
  window.cleanser.cleanText()

module.exports = Neutrominator

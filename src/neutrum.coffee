
class Neutrumator

  tagNames = ['h1','h2','h3','h4','h5','p']

  constructor: ->
    console.log('Neutrumator geladen')

  cleanText: ->
    for tagName in tagNames
      if document.getElementsByTagName(tagName).length > 0
        for element in document.getElementsByTagName(tagName)
          @removeStupidityFrom element

  removeStupidityFrom: (content) ->
    while content.innerText.match(/\*innen/)
      content.innerText = content.innerText.replace(/\*innen/,"Innen")
    while content.innerText.match(/_innen/)
      content.innerText = content.innerText.replace(/_innen/,"Innen")
    while content.innerText.match(/\*in /)
      content.innerText = content.innerText.replace(/\*in /," ")
    while content.innerText.match(/\*n /)
      content.innerText = content.innerText.replace(/\*n /,"n ")

window.cleaner = new Neutrumator()
window.onload = ->
  window.cleaner.cleanText()

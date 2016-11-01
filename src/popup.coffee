class NeutominatorLoader

  constructor: ->
    @selectedMode = "Stark"
    @readCleanMode()
    @init()

    
  init: ->
    document.getElementById('hardmode').addEventListener 'click', @setCleanMode
    document.getElementById('softmode').addEventListener 'click', @setCleanMode
    document.getElementById('neutronen').addEventListener 'click', =>
      @setCleanMode()
      @sendMessage()
    , false

  sendMessage: ->
    if @selectedMode is "Schwach"
      chrome.extension.sendMessage({ msg: "cleanUpSoftly" })
    else
      chrome.extension.sendMessage({ msg: "cleanUp" })

  readCleanMode: ->
    chrome.storage.local.get 'modeValue', (result) =>
      if result.modeValue is "Schwach"
        @selectedMode = "Schwach"
        document.getElementById('softmode').checked = true
      else
        @selectedMode = "Stark"
        document.getElementById('hardmode').checked = true
      @sendMessage()

  setCleanMode: ->
    @selectedMode = document.querySelector('input[name="cleanseMode"]:checked').value
    chrome.storage.local.set
      'modeValue': document.querySelector('input[name="cleanseMode"]:checked').value

document.addEventListener 'DOMContentLoaded', ->
  new NeutominatorLoader()
, false


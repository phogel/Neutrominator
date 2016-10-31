Neutrominator = require '../src/neutrum.coffee'

describe 'Neutrominator', ->

  cleanser = null
  element =
    innerText: 'nothing' 

  beforeEach ->
    cleanser = new Neutrominator()

  describe 'replaceIt', ->
    
    it 'replaces element.innerText with given term', ->
      element.innerText = '01234'
      cleanser.replaceIt element, /123/, "321"
      expect(element.innerText).toEqual '03214'
    
  describe 'parseAndRewrite', ->

    it 'replaces *innen and _innen with Innen', ->
      element.innerText = 'Ros*innen'
      cleanser.parseAndRewrite element
      expect(element.innerText).toEqual 'RosInnen'



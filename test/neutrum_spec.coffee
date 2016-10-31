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

  describe 'parseAndRewriteStrict', ->
    
    it 'removes *innen and _innen', ->
      element.innerText = 'Ros*innen'
      cleanser.parseAndRewriteStrict element
      expect(element.innerText).toEqual 'Ros'

    it 'creates correct form for Autor*innen', ->
      element.innerText = 'Autor*innen'
      cleanser.parseAndRewriteStrict element
      expect(element.innerText).toEqual 'Autoren'

    it 'creates correct form for Autor_innen', ->
      element.innerText = 'Autor_innen'
      cleanser.parseAndRewriteStrict element
      expect(element.innerText).toEqual 'Autoren'

    it 'creates correct form for Spieler*innen', ->
      element.innerText = 'Spieler*innen'
      cleanser.parseAndRewriteStrict element
      expect(element.innerText).toEqual 'Spieler'

    it 'creates correct dative form for Spieler*innen', ->
      element.innerText = 'Ruhm den Spieler*innen'
      cleanser.parseAndRewriteStrict element
      expect(element.innerText).toEqual 'Ruhm den Spielern'

    it 'creates correct dative form for Autor_innen', ->
      element.innerText = 'Ruhm den Autor_innen'
      cleanser.parseAndRewriteStrict element
      expect(element.innerText).toEqual 'Ruhm den Autoren'



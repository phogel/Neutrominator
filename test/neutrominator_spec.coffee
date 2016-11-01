Neutrominator = require '../src/neutrominator.coffee'

describe 'Neutrominator', ->

  cleanser = null
  element =
    textContent: 'nothing' 

  beforeEach ->
    cleanser = new Neutrominator()

  describe 'cleanText', ->
    it 'respects doStrict parameter', ->
      document.body.innerHTML += '<p>Hallo Leser*innen</p>'
      cleanser = new Neutrominator(false)
      cleanser.parseAndRewrite = jasmine.createSpy()
      cleanser.cleanText()
      expect(cleanser.parseAndRewrite).toHaveBeenCalled()

  describe 'replaceIt', ->
    
    it 'replaces element.textContent with given term', ->
      element.textContent = '01234'
      cleanser.replaceIt element, /123/, "321"
      expect(element.textContent).toEqual '03214'

    it 'replaces all occurences of term', ->
      element.textContent = '01234 and 41230'
      cleanser.replaceIt element, /123/g, "321"
      expect(element.textContent).toEqual '03214 and 43210'
    
  describe 'parseAndRewrite', ->

    it 'replaces *innen and _innen with Innen', ->
      element.textContent = 'Ros*innen Alter_innen'
      cleanser.parseAndRewrite element
      expect(element.textContent).toEqual 'RosInnen AlterInnen'

  describe 'parseAndRewriteStrict', ->
    
    it 'removes *innen and _innen', ->
      element.textContent = 'Ros*innen'
      cleanser.parseAndRewriteStrict element
      expect(element.textContent).toEqual 'Ros'

    it 'creates correct form for Autor*innen', ->
      element.textContent = 'Autor*innen'
      cleanser.parseAndRewriteStrict element
      expect(element.textContent).toEqual 'Autoren'

    it 'creates correct form for Autor_innen', ->
      element.textContent = 'Autor_innen'
      cleanser.parseAndRewriteStrict element
      expect(element.textContent).toEqual 'Autoren'

    it 'creates correct form for Spieler*innen', ->
      element.textContent = 'Spieler*innen'
      cleanser.parseAndRewriteStrict element
      expect(element.textContent).toEqual 'Spieler'

    it 'creates correct dative form when den article is used', ->
      element.textContent = 'Ruhm den Spieler*innen'
      cleanser.parseAndRewriteStrict element
      expect(element.textContent).toEqual 'Ruhm den Spielern'

    it 'creates correct dative form for Autor_innen', ->
      element.textContent = 'Ruhm den Autor_innen'
      cleanser.parseAndRewriteStrict element
      expect(element.textContent).toEqual 'Ruhm den Autoren'

    it 'creates correct form for Schwed_innen', ->
      element.textContent = 'Ruhm den Schwed_innen'
      cleanser.parseAndRewriteStrict element
      expect(element.textContent).toEqual 'Ruhm den Autoren'

    it 'creates correct form for Finalist*innen', ->
      element.textContent = 'Ruhm den Finalist*innen'
      cleanser.parseAndRewriteStrict element
      expect(element.textContent).toEqual 'Ruhm den Finalisten'




Neutrominator = require '../src/neutrominator.coffee'

describe 'Neutrominator', ->

  cleanser = null
  element =
    innerHTML: 'nothing' 

  beforeEach ->
    cleanser = new Neutrominator()
    cleanser.haystack = element


  describe 'cleanText', ->
    it 'respects doStrict parameter', ->
      document.body.innerHTML += '<p>Hallo Leser*innen</p>'
      cleanser = new Neutrominator(false)
      cleanser.parseAndRewrite = jasmine.createSpy()
      cleanser.cleanText()
      expect(cleanser.parseAndRewrite).toHaveBeenCalled()

  describe 'replaceIt', ->
    
    it 'replaces element.innerHTML with given term', ->
      element.innerHTML = '01234'
      cleanser.replaceIt /123/, "321"
      expect(element.innerHTML).toEqual '03214'

    it 'replaces all occurences of term', ->
      element.innerHTML = '01234 and 41230'
      cleanser.replaceIt /123/g, "321"
      expect(element.innerHTML).toEqual '03214 and 43210'
    
  describe 'parseAndRewrite', ->

    it 'replaces *innen and _innen with Innen', ->
      element.innerHTML = 'Ros*innen Alter_innen'
      cleanser.parseAndRewrite()
      expect(element.innerHTML).toEqual 'RosInnen AlterInnen'

  describe 'parseAndRewriteStrict', ->
    
    it 'removes *innen and _innen', ->
      element.innerHTML = 'Röstzwiebl*innen dr_innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Röstzwiebl dr'

    it 'creates correct form for Autor*innen', ->
      element.innerHTML = 'Autor*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Autoren'

    it 'creates correct form for Autor_innen', ->
      element.innerHTML = 'Autor_innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Autoren'

    it 'creates correct form for Spieler*innen', ->
      element.innerHTML = 'Spieler*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Spieler'

    it 'creates correct dative form when den article is used', ->
      element.innerHTML = 'Ruhm den Spieler*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Ruhm den Spielern'

    it 'creates correct dative form for Autor_innen', ->
      element.innerHTML = 'Ruhm den Autor_innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Ruhm den Autoren'

    it 'creates correct form for Schwed_innen', ->
      element.innerHTML = 'Ruhm den Schwed_innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Ruhm den Schweden'

    it 'creates correct form for Finalist*innen', ->
      element.innerHTML = 'Ruhm den Finalist*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Ruhm den Finalisten'




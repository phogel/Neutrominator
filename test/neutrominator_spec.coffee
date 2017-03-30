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
      element.innerHTML = 'Röstzwiebl*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Röstzwiebl'

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

    it 'creates correct form for Kund*innen', ->
      element.innerHTML = 'Kund*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Kunden'

    it 'creates correct form for Sekretär*innen', ->
      element.innerHTML = 'Sekretär*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Sekretäre'

    it 'creates correct form for Programmierer*innen', ->
      element.innerHTML = 'Programmierer*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Programmierer'

    it 'creates correct Dativ for den Programmierer*innen', ->
      element.innerHTML = 'den Programmierer*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'den Programmierern'

    it 'creates correct form for Buchhalter*innen', ->
      element.innerHTML = 'Buchhalter*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Buchhalter'

    it 'creates correct form for Kolleg*innen', ->
      element.innerHTML = 'Kolleg*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Kollegen'

    it 'creates correct dativ form for "den meisten Buchhalter*innen"', ->
      element.innerHTML = 'den meisten Buchhalter*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'den meisten Buchhaltern'

    it 'creates correct Nominativ for "die meisten Buchhalter*innen"', ->
      element.innerHTML = 'die meisten Buchhalter*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'die meisten Buchhalter'

    it 'creates correct Dativ for "den meisten Buchhalter*innen und Sekretär*innen"', ->
      element.innerHTML = 'den meisten Buchhalter*innen und Sekretär*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'den meisten Buchhaltern und Sekretären'

    it 'creates correct Helfer', ->
      element.innerHTML = 'kamen Helfer*innen von'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'kamen Helfer von'

    it 'creates correct Chefs', ->
      element.innerHTML = 'ihren Chef*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'ihren Chefs'

    it 'creates correct Verleger*in', ->
      element.innerHTML = 'Verleger*in '
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Verleger '

      element.innerHTML = 'Suppenterr*ine'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Suppenterr*ine'

      element.innerHTML = 'Verleger*in.'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Verleger.'

      element.innerHTML = 'Verleger*in,'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Verleger,'



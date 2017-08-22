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

    it 'removes die from die*derjenige', ->
      element.innerHTML = 'wie die*derjenige'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'wie derjenige'

    it 'removes Die from Die*derjenige', ->
      element.innerHTML = 'wie die*derjenige'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'wie derjenige'

    it 'removes Der from Der*diejenige', ->
      element.innerHTML = 'Der*diejenige'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Derjenige'

    it 'cleanses seine*ihre', ->
      element.innerHTML = 'seine*ihre '
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'seine '

    it 'cleanses ihre*seine', ->
      element.innerHTML = 'ihre*seine '
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'seine '

    it 'cleanses ein*e ', ->
      element.innerHTML = 'ein*e '
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'eine '


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

    it 'creates correct Dativ for Den Programmierer*innen', ->
      element.innerHTML = 'Den Programmierer*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Den Programmierern'

    it 'creates correct form for Buchhalter*innen', ->
      element.innerHTML = 'Buchhalter*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Buchhalter'

    it 'creates correct form for Kolleg*innen', ->
      element.innerHTML = 'Kolleg*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Kollegen'

    it 'creates correct dativ form for " den meisten Buchhalter*innen"', ->
      element.innerHTML = ' den meisten Buchhalter*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual ' den meisten Buchhaltern'

    it 'creates correct Nominativ for "die meisten Buchhalter*innen"', ->
      element.innerHTML = 'die meisten Buchhalter*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'die meisten Buchhalter'

    it 'creates correct Dativ for "den meisten Buchhalter*innen und Sekretär*innen"', ->
      element.innerHTML = ' den meisten Buchhalter*innen und Sekretär*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual ' den meisten Buchhaltern und Sekretären'

    it 'creates correct Helfer', ->
      element.innerHTML = 'kamen Helfer*innen von'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'kamen Helfer von'

    it 'creates correct Chefs', ->
      element.innerHTML = 'ihren Chef*innen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'ihren Chefs'

    it 'creates correct Zuschauersitzen', ->
      element.innerHTML = 'in den gepolsterten Zuschauer*innensitzen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'in den gepolsterten Zuschauersitzen'

    it 'creates correct Zuschauersitzen', ->
      element.innerHTML = 'Den gepolsterten Zuschauer*innensitzen'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Den gepolsterten Zuschauersitzen'

    it 'creates correct die künstlerischen Leiter', ->
      element.innerHTML = 'Danach stehen die künstlerischen Leiter*innen von Bühnenbild, Kostümen, Musik, Video etc., die an ihre Assistent*innen delegieren, die wiederum mit den Hospitant*innen kommunizieren.'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Danach stehen die künstlerischen Leiter von Bühnenbild, Kostümen, Musik, Video etc., die an ihre Assistenten delegieren, die wiederum mit den Hospitanten kommunizieren.'

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

    it 'creates correct eine*r', ->
      element.innerHTML = 'Was wäre, wenn in der Kulturbranche eine*r mehr unbezahlte Praktika machen würde?'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Was wäre, wenn in der Kulturbranche einer mehr unbezahlte Praktika machen würde?'

      element.innerHTML = 'Was wäre, wenn in der Kulturbranche eine*r. mehr unbezahlte Praktika machen würde?'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Was wäre, wenn in der Kulturbranche einer. mehr unbezahlte Praktika machen würde?'

    it 'creates correct Nominativ for combo Eingeladen waren Vertreter', ->
      element.innerHTML = 'Eingeladen waren Vertreter*innen des Justizministeriums'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'Eingeladen waren Vertreter des Justizministeriums'

    it 'creates correct von Akteuren', ->
      element.innerHTML = 'von Akteur*innen der Innenverkleidung'
      cleanser.parseAndRewriteStrict()
      expect(element.innerHTML).toEqual 'von Akteuren der Innenverkleidung'


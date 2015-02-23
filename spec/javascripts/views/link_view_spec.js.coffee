#= require spec_helper
#= require models/link
#= require views/link_view

describe 'LinkView', ->

  beforeEach ->
    page.append '<div class="link-form"></div>'
    @view = new App.Views.LinkView
    @el = @view.render().$el
    @fakeServer = sinon.fakeServer.create()

  describe '#render', ->
    it 'renders a form', ->
      expect(@el).to.have('.link-input')

  describe 'creating a link', ->
    beforeEach ->
      @serverLink = 'http://nickcox.me'
      $('.link-input').val(@serverLink)
      $('button').click()
      @fakeServer.respondWith([200, { "Content-Type": "application/json" }, "{ \"link\": \"#{@serverLink}\"}"])
      @fakeServer.respond()

    it 'displays the server-returned link', ->
      expect(@el).to.have('.link')
      expect(@el).to.have('.shortened-link')
      expect($('.link span').text().trim()).to.eq("Your link is #{@serverLink}")

  describe 'creating a link: invalid', ->
    beforeEach ->
      $('.link-input').val('puppies')
      $('button').click()
      @errorMsg = "Huh. That doesn't seem to be a valid URL. Try again?"
      @fakeServer.respondWith([422, { "Content-Type": "application/json" }, "{ \"url\": \"#{@errorMsg}\"}"])
      @fakeServer.respond()

    it 'populates the errors div', ->
      expect($('.errors')).to.have.text(@errorMsg)

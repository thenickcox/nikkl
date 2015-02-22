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
      $('.link-input').val('http://nickcox.me')
      $('button').click()
      @serverLink = 'http://localhost:3000/foobar'
      @fakeServer.respondWith([200, { "Content-Type": "application/json" }, "{ \"link\": \"#{@serverLink}\"}"])
      @fakeServer.respond()

    it 'displays the server-returned link', ->
      expect(@el).to.have('.link')
      expect(@el).to.have('.shortened-link')
      expect($('.link span').text().trim()).to.eq("Your link is #{@serverLink}")


#= require templates/link_form

App.Views.LinkView = Backbone.View.extend
  el: '.link-form'
  template: JST['templates/link_form']
  replaceTemplate: JST['templates/link_display']
  model: new App.Models.Link
  initialize: ->
    @listenTo @model, 'sync', @showSlug
  render: ->
    @$el.html(@template(@model.attributes))
    this
  events:
    'click .go': 'createLink'
  createLink: ->
    url = $('.link-input').val()
    @model.save
      url: url
    ,
      success: (model, response, opts) =>
        @servResponse = response
  showSlug: ->
    console.log @servResponse
    @$el.html @replaceTemplate(@servResponse)
    clip = new ZeroClipboard $('#copy-button')


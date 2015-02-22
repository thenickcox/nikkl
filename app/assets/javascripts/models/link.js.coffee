App.Models.Link = Backbone.Model.extend
  url: '/links'
  toJSON: ->
    { link: _.clone @attributes }

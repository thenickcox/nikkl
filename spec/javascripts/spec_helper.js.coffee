#= require jquery
#= require underscore
#= require backbone
#= require chai-jquery
#= require sinon
#= require sinon-chai
#= require application

beforeEach ->
  window.page = $('#konacha')

window.p = (args...) ->
  console?.log args...

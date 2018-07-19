class @DatepickerInit
  constructor: (input)->
    return unless input

    @$input = $(input)
    @_init()

  _init:->
    @$input.datetimepicker
      format: 'DD-MM-YYYY HH:mm'

$ ->
  new DatepickerInit(input) for input in $('[data-input="datetimepicker"]')

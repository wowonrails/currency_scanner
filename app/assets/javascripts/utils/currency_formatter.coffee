class @CurrencyFormatter
  constructor: ->
    @formatter = new (Intl.NumberFormat)('ru',
      style: 'currency',
      currency: 'RUB',
      minimumFractionDigits: 2
    )

  format: (value) ->
    @formatter.format(value)

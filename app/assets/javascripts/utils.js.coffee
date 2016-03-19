#= require_tree ./helpers
#= require i18n
#= require i18n/translations

I18n.defaultLocale = 'en'
I18n.fallbacks = true

@formatAmount = (value) ->
  I18n.l("currency", Number(value))

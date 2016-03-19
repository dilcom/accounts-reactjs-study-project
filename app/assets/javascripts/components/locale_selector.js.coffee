@LocaleSelector = React.createClass
  getInitialState: ->
    locales: ['en', 'ru']
    currentLocale: I18n.locale
  handleSelect: (data) ->
    locale = data.target.value
    @setState currentLocale: locale
    @props.handleLocaleSelect(locale)
  render: ->
    React.DOM.div
      className: 'row'
      React.DOM.select
        key: 'locale-selector'
        defaultValue: @state.currentLocale
        multiple: false
        onChange: @handleSelect
        for locale in @state.locales
          React.DOM.option
            key: locale
            value: locale
            label: I18n.t("locales.#{locale}")

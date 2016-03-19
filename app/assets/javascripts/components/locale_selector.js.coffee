@LocaleSelector = React.createClass
  render: ->
    React.DOM.div
      className: 'row'
      React.DOM.select
        key: 'locale-selector'
        defaultValue: I18n.locale
        multiple: false
        onChange: @props.handleLocaleSelect
        for locale in ['en', 'ru']
          React.DOM.option
            key: locale
            value: locale
            label: I18n.t("locales.#{locale}")

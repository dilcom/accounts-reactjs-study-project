@AccountsApp = React.createClass
  handleLocaleSelect: (locale) ->
    I18n.locale = locale
    @forceUpdate()
  render: ->
    React.DOM.div
      className: 'container'
      React.DOM.div
        className: 'row'
        React.createElement LocaleSelector,
          handleLocaleSelect: @handleLocaleSelect
      React.createElement Records,
        data: @props.data,
        resourcePath: @props.resourcePath

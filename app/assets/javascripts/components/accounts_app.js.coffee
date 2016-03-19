@AccountsApp = React.createClass
  getInitialState: ->
    I18n.locale = @props.locale
    null
  handleLocaleSelect: (data) ->
    locale = data.target.value
    I18n.locale = locale
    $.ajax
      method: 'PUT'
      url: 'update_locale'
      dataType: 'JSON'
      data: { locale: locale }
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

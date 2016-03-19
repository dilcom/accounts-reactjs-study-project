@Record = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "#{@props.resourcePath}/#{@props.record.id}"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteRecord @props.record
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.record.date
      React.DOM.td null, @props.record.title
      React.DOM.td null, formatAmount(@props.record.amount)
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-danger'
          onClick: @handleDelete
          I18n.t('helpers.actions.delete')

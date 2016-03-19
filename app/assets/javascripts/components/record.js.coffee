@Record = React.createClass
  getInitialState: ->
    date: @props.record.date
    title: @props.record.title
    amount: @props.record.amount
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "#{@props.resourcePath}/#{@props.record.id}"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteRecord @props.record
  handleUpdate: (name, value, callback) ->
    console.log("#{name}: #{value}")
  render: ->
    React.DOM.tr null,
      React.createElement EditableCell,
        value: @state.date
        inputOptions: { type: 'date' }
        name: 'date'
        handleUpdate: @handleUpdate
      React.createElement EditableCell,
        value: @state.title
        inputOptions: { type: 'text' }
        name: 'title'
        handleUpdate: @handleUpdate
      React.createElement EditableCell,
        value: @state.amount
        inputOptions: { type: 'number', step: 0.01 }
        name: 'amount'
        handleUpdate: @handleUpdate
        format: formatAmount
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-danger'
          onClick: @handleDelete
          I18n.t('helpers.actions.delete')

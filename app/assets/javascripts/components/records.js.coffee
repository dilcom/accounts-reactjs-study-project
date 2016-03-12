@Records = React.createClass
  getInitialState: ->
    records: @props.data
  getDefaultState: ->
    records: []
  addNewRecord: (record) ->
    records = @state.records.slice()
    records.push(record)
    @setState records: records
  credit: ->
    elements = @state.records.filter (val) -> val.amount > 0
    elements.reduce ((sum, val) -> sum + parseFloat(val.amount)), 0
  debit: ->
    elements = @state.records.filter (val) -> val.amount < 0
    elements.reduce ((sum, val) -> sum + parseFloat(val.amount)), 0
  balance: ->
    @debit() + @credit()
  render: ->
    React.DOM.div
      class_name: 'records'
      React.DOM.h2
        class_name: 'title'
        'Records'
      React.DOM.div
        className: 'row'
        React.createElement AmountBox, type: 'success', amount: @debit(), text: 'Debit'
        React.createElement AmountBox, type: 'danger', amount: @credit(), text: 'Credit'
        React.createElement AmountBox, type: 'info', amount: @balance(), text: 'Balance'
      React.DOM.hr null
      React.createElement RecordForm,
        key: 'create-record',
        handleNewRecord: @addNewRecord,
        submitPath: @props.submitPath
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.td null, 'Title'
            React.DOM.td null, 'Date'
            React.DOM.td null, 'Amount'
        React.DOM.tbody null,
          for record in @state.records
            React.createElement Record, key: record.id, record: record

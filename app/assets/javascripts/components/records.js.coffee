@Records = React.createClass
  getInitialState: ->
    records: @props.data
  getDefaultState: ->
    records: []
  addNewRecord: (record) ->
    records = React.addons.update(@state.records, $push: [record])
    @setState records: records
  deleteRecord: (record) ->
    index = @state.records.indexOf(record)
    records = React.addons.update(@state.records, $splice: [[index, 1]])
    @setState records: records
  debit: ->
    elements = @state.records.filter (val) -> val.amount > 0
    elements.reduce ((sum, val) -> sum + parseFloat(val.amount)), 0
  credit: ->
    elements = @state.records.filter (val) -> val.amount < 0
    elements.reduce ((sum, val) -> sum + parseFloat(val.amount)), 0
  balance: ->
    @debit() + @credit()
  render: ->
    React.DOM.div
      className: 'records'
      React.DOM.h2
        className: 'title'
        I18n.t('react_components.records.title')
      React.DOM.div
        className: 'row'
        React.createElement AmountBox, type: 'success', amount: @debit(), text: I18n.t('react_components.records.debit')
        React.createElement AmountBox, type: 'danger', amount: @credit(), text: I18n.t('react_components.records.credit')
        React.createElement AmountBox, type: 'info', amount: @balance(), text: I18n.t('react_components.records.balance')
      React.DOM.hr null
      React.createElement RecordForm,
        key: 'create-record',
        handleNewRecord: @addNewRecord,
        resourcePath: @props.resourcePath
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.td null, I18n.t('react_components.records.table_headers.title')
            React.DOM.td null, I18n.t('react_components.records.table_headers.date')
            React.DOM.td null, I18n.t('react_components.records.table_headers.amount')
            React.DOM.td null, I18n.t('react_components.records.table_headers.actions')
        React.DOM.tbody null,
          for record in @state.records
            React.createElement Record, key: record.id, record: record, resourcePath: @props.resourcePath, handleDeleteRecord: @deleteRecord

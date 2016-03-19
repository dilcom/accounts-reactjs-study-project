@RecordForm = React.createClass
  getInitialState: ->
    title: ''
    date: ''
    amount: ''
  valid: ->
    @state.title && @state.amount && @state.date
  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    $.post @props.resourcePath, { record: @state }, @handleSubmitSuccess, 'JSON'
  handleSubmitSuccess: (data) ->
    @props.handleNewRecord data
    @setState @getInitialState()
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'date'
          className: 'form-control'
          name: 'date'
          value: @state.date
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: I18n.t('react_components.record_form.title_placeholder')
          name: 'title'
          value: @state.title
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'number'
          step: 0.01
          className: 'form-control'
          placeholder: I18n.t('react_components.record_form.amount_placeholder')
          name: 'amount'
          value: @state.amount
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        I18n.t('helpers.actions.save')

@EditableCell = React.createClass
  getInitialState: ->
    name: @props.name
    value: @props.value
    inputOptions: @props.inputOptions
    format: @props.format || @noFormat
    handleUpdate: @props.handleUpdate
    state: 'view'
  handleEditStart: ->
    @setState state: 'edit'
  handleEditEnd: ->
    @state.handleUpdate(@state.name, @state.value, @handleSave)
    @setState state: 'disabled'
  handleChange: (e) ->
    @setState value: e.target.value
  noFormat: (v) ->
    v
  handleSave: ->
    @setState state: 'view'
  render: ->
    React.DOM.td null,
      switch @state.state
        when 'edit'
          React.DOM.input merge @state.inputOptions,
            value: @state.value
            onBlur: @handleEditEnd
            onChange: @handleChange
            autoFocus: true
        when 'disabled'
          React.DOM.span
            className: 'editable-cell disabled'
            @state.format(@state.value)
        else
          React.DOM.span
            className: 'editable-cell'
            onClick: @handleEditStart
            @state.format(@state.value)

@EditableCell = React.createClass
  getInitialState: ->
    name: @props.name
    value: @props.value
    oldValue: @props.value
    inputOptions: @props.inputOptions
    format: @props.format || @noFormat
    handleUpdate: @props.handleUpdate
    state: 'view'
  handleEditStart: ->
    @setState state: 'edit'
  handleEditEnd: ->
    if @state.oldValue == @state.value
      @setState state: 'view'
    else
      @state.handleUpdate(@state.name, @state.value, @handleSave)
      @setState state: 'disabled'
  handleChange: (e) ->
    @setState value: e.target.value
  handleSave: ->
    @setState state: 'view', old_value: @state.value
  handleKeyDown: (e) ->
    switch e.key
      when 'Enter', 'Tab'
        @handleEditEnd()
      when 'Escape'
        @setState state: 'view', value: @state.oldValue
  noFormat: (v) ->
    v
  render: ->
    React.DOM.td null,
      switch @state.state
        when 'edit'
          React.DOM.input merge @state.inputOptions,
            value: @state.value
            onBlur: @handleEditEnd
            onChange: @handleChange
            onKeyDown: @handleKeyDown
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

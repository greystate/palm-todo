class Task

	constructor: (@title = "New Todo", @priority = 1, @category = TodoList.DEFAULT_CATEGORY, @done = no) ->
		@id = randomInteger 9999

	toggle: ->
		@done = not @done

	render: ->
		element = document.createElement "li"
		element.id = "todo-#{@id}"
		checkbox = document.createElement "input"
		checkbox.setAttribute "type", "checkbox"
		checkbox.className = "priority-#{@priority}"
		checkbox.checked = @done
		label = document.createElement "label"
		label.textContent = @title
		label.contentEditable = yes
		
		element.appendChild checkbox
		element.appendChild label
		element

window.Task = Task

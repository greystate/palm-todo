# Global app object 
@app = window.app ? {}	

KEY_RETURN = 13

# Main controller for the page's functions
class ZireController
	constructor: () ->
		@builder = new FixtureBuilder
		@todos = new TodoList
		@todos.items = @builder.randomList 4
		@todos.render $ '#todos'
		
		@setupHandlers()
	
	setupHandlers: () =>
		$on ($ '#new-task'), "click", @addNewTask
		$on ($ 'body'), "keyup", @handleKeyup
	
	handleKeyup: (event) =>
		if event.keyCode is KEY_RETURN
			if event.target.nodeName is "BODY" and event.altKey
				event.preventDefault()
				@addNewTask()
	
	addNewTask: =>
		task = new Task
		@todos.add task
		
		$label = $ "#todo-#{task.id} label"
		selectContentEditable $label

# Start everything when the page is ready
$on window, "DOMContentLoaded", ->
	app.controller = new ZireController


# @codekit-prepend "helpers.coffee"
# @codekit-prepend "fixture-builder.coffee"
# @codekit-prepend "todolist.coffee"
# @codekit-prepend "task.coffee"

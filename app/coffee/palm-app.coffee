# Global app object 
@app = window.app ? {}	

KEY_RETURN = 13

# Main controller for the page's functions
class ZireController
	constructor: () ->
		@todos = new TodoList
		@loadState()
		@todos.render $ '#todos'
		
		@setupHandlers()
	
	setupHandlers: () =>
		$on ($ '#new-task'), "click", @addNewTask
		$on ($ 'body'), "keyup", @handleKeyup
		$on	($ '#clear'), "click", @clearList
		$on	($ '#randomize'), "click", @randomizeList
	
	handleKeyup: (event) =>
		if event.keyCode is KEY_RETURN
			if event.target.nodeName is "BODY" and event.altKey
				event.preventDefault()
				@saveState()
				@addNewTask()
	
	addNewTask: =>
		task = new Task
		@todos.add task
		
		$label = $ "#todo-#{task.id} label"
		selectContentEditable $label
	
	saveState: ->
		window.localStorage.setItem "todolist", JSON.stringify @todos.items
	
	loadState: ->
		items = JSON.parse window.localStorage.getItem "todolist"
		if items? and items.length isnt 0
			for task in items
				@todos.add new Task task
	
	clearList: =>
		@todos.items = []
		@todos.changed()
		
	randomizeList: =>
		builder = new FixtureBuilder
		@todos.items = builder.randomList 4
		@todos.changed()
		
	
# Start everything when the page is ready
$on window, "DOMContentLoaded", ->
	app.controller = new ZireController


# @codekit-prepend "helpers.coffee"
# @codekit-prepend "fixture-builder.coffee"
# @codekit-prepend "todolist.coffee"
# @codekit-prepend "task.coffee"

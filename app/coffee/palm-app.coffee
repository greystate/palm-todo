# Global app object 
@app = window.app ? {}	

# Main controller for the page's functions
class ZireController
	constructor: () ->
		@setupHandlers()
	
	setupHandlers: () =>
		$on ($ '#new-task'), "click", @addNewTask
	
	addNewTask: ->
		todo = document.createElement "li"
		todo.innerHTML = '<input id="todo-1542" type="checkbox" /><label>New todo</label>'
		$label = $ 'label', todo
		$label.contentEditable = yes
		($ '.todolist ul').appendChild todo
		selectContentEditable $label


# Start everything when the page is ready
$on window, "DOMContentLoaded", ->
	app.controller = new ZireController


# @codekit-prepend "helpers.coffee"
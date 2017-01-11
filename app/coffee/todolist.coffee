class TodoList
	@DEFAULT_CATEGORY = "Unspecified"
	
	constructor: (@items = []) ->
		@element = null
	
	add: (task) ->
		@items.push task
		@changed()
	
	remove: (index) ->
		@items.splice index, 1
		@changed()
	
	changed: ->
		@render()
	
	render: (container = @element) ->
		if container?
			@element = container
			while container.children.length
				container.removeChild container.children[0]
	
		itemContainer = document.createDocumentFragment()
		itemContainer.appendChild item.render() for item in @items
		container?.appendChild itemContainer
		itemContainer

window.TodoList = TodoList

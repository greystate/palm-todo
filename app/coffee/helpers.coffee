$ = (selector, scope = document) ->
	if typeof selector is "object" then selector else scope.querySelector selector

$$ = (selector, scope = document) ->
	scope.querySelectorAll selector

$on = (selector, type, handler) ->
	($ selector).addEventListener type, handler, no

# Modified from this [Gist](https://gist.github.com/al3x-edge/1010364)
selectContentEditable = (contentEditableElement) ->
	# Create a range (a range is a like the selection but invisible)
	range = document.createRange()
	
	# Select the entire contents of the element with the range
	range.selectNodeContents contentEditableElement
	
	# Un-comment this to collapse the range to the end point. (`no` means collapse to end rather than the start
	# range.collapse no
	
	# Get the selection object (allows you to change selection)
	selection = window.getSelection()
	
	# Remove any selections already made
	selection.removeAllRanges()
	
	# Make the range we have just created the visible selection
	selection.addRange range


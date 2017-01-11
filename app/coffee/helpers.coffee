# Return the first item matching the `selector` (CSS syntax, e.g.: ".header")
$ = (selector, scope = document) ->
	if typeof selector is "object" then selector else scope.querySelector selector

# Returns a NodeList of elements that matches `selector`
$$ = (selector, scope = document) ->
	scope.querySelectorAll selector

# Attach `handler` on `selector` for events of `type`
$on = (selector, type, handler) ->
	($ selector).addEventListener type, handler, no

# Selectes the contents of an element
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

# Returns a random integer between 1 and `upto`
randomInteger = (upto = 10) ->
	Math.floor 1 + Math.random() * upto

# Returns a random item from `array`
randomItem = (array) ->
	pick = randomInteger array.length
	array[pick - 1]

# Returns a sentence constructed from a verb and a noun, connected by a "connector" (like "a" or "the").
randomSentence = () ->
	VERBS = ["start", "stop", "play", "build", "find", "test", "save"]
	CONNECTORS = ["a", "that", "behind the", "the"]
	NOUNS = ["elephant", "lamp", "cassowary", "table", "mug", "keyboard", "clock tower"]

	title = [
		randomItem(VERBS)
		randomItem(CONNECTORS)
		randomItem(NOUNS)
	].join " "
	
	# Correct "[...] a elephant" to "an elephant" :)
	title = title.replace /a e/, "an e"

	sentence = "#{(title.charAt 0).toUpperCase()}#{title.substr 1}"

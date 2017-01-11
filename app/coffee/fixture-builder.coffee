class FixtureBuilder
	constructor: () ->

	# Returns a random `Task`
	randomTask: ->
		new Task randomSentence()
	
	# Returns a list of `count` random tasks
	randomList: (count = 2) ->
		items = []
		t = 1
		while t++ <= count
			items.push @randomTask()
		items
		

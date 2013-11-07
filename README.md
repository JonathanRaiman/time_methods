Box Puts
========

Output text in a framed box, with a title.

		
	┌─────[Hello World]──────────────────────────────────────────────────┐
	│                   box_puts let you put text in                     │
	│                              boxes!                                │
	└────────────────────────────────────────────────────────────────────┘


Usage
-----

To get started `gem install box_puts`, then:

	require 'box_puts'

	BoxPuts.show(
		:title => "Hello World",
		:align => "center",
		:lines => ["box_puts let you put text in", "boxes!"]
	)
	┌─────[Hello World]──────────────────────────────────────────────────┐
	│                   box_puts let you put text in                     │
	│                              boxes!                                │
	└────────────────────────────────────────────────────────────────────┘
	#=> nil
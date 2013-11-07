# coding: utf-8
# @author Jonathan Raiman

module BoxPuts
	# Output a boxed set of text, specifiy alignment, and place a title above the box.
	#
	# @param opts [Hash] parameters for the box with the text
	# @option opts [Fixnum] :width How wide to draw the box. Defaults to 70 characters.
	# @option opts [String] :align Text alignment within the box: `left`, `center`, or `right`. Defaults to `left`.
	# @option opts [String] :title An optional title to place above the box.
	# @option opts [Array<String>] :lines An array of lines to output inside the box.
	def self.show(opts={})
		width, title, align = opts[:width] || 70, opts[:title], opts[:align] || "left"
		lines = ["┌"+(title ? (("─"*5)+"[#{title[0..(width-10)]}]"+(width-9-title.length > 0 ? ("─"*(width-9-title.length)) : "")) : "─"*(width-2))+"┐"]
		opts[:lines].each do |line|
			text = "│"
			if align == "left" or line.length > width-3
				text += " "+line[0..(width-4)]+((width-3-line.length) > 0 ? (" "*(width-3-line.length)) : "")
			elsif align == "center"
				rem_width = width-2-(width-3-line.length)/2-line[0..(width-4)].length-(width-2-line.length)/2
				text += (" "*((width-3-line.length)/2))+line[0..(width-4)]+(" "*((width-2-line.length)/2))
				if rem_width > 0 then text += " "*rem_width end
			else
				text += (" "*(width-3-line.length))+line[0..(width-4)]+" "
			end
			text += "│"
			lines << text
		end
		lines << ("└"+("─"*(width-2))+"┘")
		puts lines
	end
end
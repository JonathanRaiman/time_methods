# coding: utf-8
# @author Jonathan Raiman

# perform relative time conversions really easily.
module TimeMethods

	# Pluralizes a string by adding "s" to the element name when there are 0 or 2+ elements.
	# @param number [FixNum] number of elements to pluralize
	# @param text [String] the element being pluralized
	# @return [String] the pluralized string.
	def self.pluralize(number, text)
		return "#{text}s" if number != 1
		text
	end

	# Converts time to non-relative human-readable format.
	# @param t [Time] the time to convert
	# @return [String] the time in human-readable format (Not words per-se).
	def self.factual_time(t)
		msg = ""
		if t.day == Time.now.day
			msg += "Today"
		elsif Time.now-3600*48 < t
			msg += "Yesterday"
		else
			msg += t.strftime('%-d %B %Y')
		end
		msg += t.strftime(' %H:%M:%S')
		# msg += " "
		# msg += t.hour.to_s+":"+t.min.to_s+":"+t.sec.to_s
		msg
	end

	# Converts time from an integer or float amount of seconds to words.
	# @param diff_seconds [Fixnum, Float] time to convert to words
	# @return [String] time in words elapsed
	def self.relative_time(diff_seconds)
		delta_t = (diff_seconds.class == Float) ? diff_seconds.to_i : diff_seconds
		case delta_t
			when 0 .. 5
				if diff_seconds.class == Float
					"#{sprintf('%.2f',diff_seconds)} "+pluralize(delta_t, 'second')
				else
					"#{delta_t} "+pluralize(delta_t, 'second')
				end
			when 6 .. 59
				"#{delta_t} "+pluralize(delta_t, 'second')
			when 60 .. (3600-1)
				"#{delta_t/60} "+pluralize((delta_t/60), 'minute')
			when 3600 .. (3600*24-1)
				"#{delta_t/3600} "+pluralize((delta_t/3600), 'hour')
			when (3600*24) .. (3600*24*7-1) 
				"#{delta_t/(3600*24)} "+pluralize((delta_t/(3600*24)), 'day')
			when (3600*24*7) .. (3600*24*30-1)
				"#{delta_t/(3600*24*7)} "+pluralize((delta_t/(3600*24*7)), 'week')
			when (3600*24*30) .. (3600*24*365.25)
				"#{delta_t/(3600*24*30)} "+pluralize((delta_t/(3600*24*30)), 'month')
			when (3600*24*365.25) .. (3600*24*3652.5)
				"#{delta_t/(3600*24*30)} "+pluralize((delta_t/(3600*24*365.25)), 'year')
			else
				"#{delta_t}s"
		end
	end

	# Converts time into words with a Facebook like lingo ("just now", "an hour ago", etc...).
	# @param start_time [Time] time to convert to words
	# @return [String] time elapsed in words
	def self.time_ago(start_time)
		diff_seconds = Time.now.to_i - start_time.to_i
		case diff_seconds
			when 0 .. 59
				"just now"
			when 60 .. (3000-1)
				"#{diff_seconds/60} "+pluralize((diff_seconds/60), 'minute')+" ago"
			when 3000 .. (3500-1)
				"almost an hour ago"
			when 3500 .. (3700-1)
				"an hour ago"
			when 3700 .. (3900-1)
				"over an hour ago"
			when 3900 .. (3600*24-1)
				"#{diff_seconds/3600} "+pluralize((diff_seconds/3600), 'hour')+" ago"
			when (3600*24) .. (3600*24*7-1) 
				"#{diff_seconds/(3600*24)} "+pluralize((diff_seconds/(3600*24)), 'day')+" ago"
			when (3600*24*7) .. (3600*24*30-1)
				"#{diff_seconds/(3600*24*7)} "+pluralize((diff_seconds/(3600*24*7)), 'week')+" ago"
			when (3600*24*30) .. (3600*24*365.25)
				"#{diff_seconds/(3600*24*30)} "+pluralize((diff_seconds/(3600*24*30)), 'month')+" ago"
			else
				start_time.strftime('%-d %B %Y')
		end
	end

end
# Time is an abstraction of dates and times. Time is stored internally as the number of seconds with fraction since the Epoch, January 1, 1970 00:00 UTC. Also see the library module Date. The Time class treats GMT (Greenwich Mean Time) and UTC (Coordinated Universal Time) as equivalent. GMT is the older way of referring to these baseline times but persists in the names of calls on POSIX systems.
#
# All times may have fraction. Be aware of this fact when comparing times with each other – times that are apparently equal when displayed may be different when compared.
#
# Since Ruby 1.9.2, Time implementation uses a signed 63 bit integer, Bignum or Rational. The integer is a number of nanoseconds since the Epoch which can represent 1823-11-12 to 2116-02-20. When Bignum or Rational is used (before 1823, after 2116, under nanosecond), Time works slower as when integer is used.
class Time
	# Converts time into words with a Facebook like lingo ("just now", "an hour ago", etc...).
	# @return [String] time elapsed in words 
	def ago
		TimeMethods.time_ago(self)
	end
	# converts time to non-relative human-readable format
	# @return [String] the time in human-readable format (Not words per-se).
	def factual
		TimeMethods.factual_time(self)
	end
end
Box Puts
========

Converts time and time intervals to human readable forms.

	TM = TimeMethods
	TM.factual_time(Time.now) #=> "Today 15:03:06"
	TM.time_ago(Time.now-5) #=> "just now"
	TM.relative_time(20*60) #=> "20 minutes"


Usage
-----

To get started `gem install time_methods`, then:

	require 'time_methods'

	TimeMethods.factual_time(Time.now) #=> "Today 15:03:20"
	TimeMethods.time_ago(Time.now-5) #=> "just now"
	TimeMethods.relative_time(20*60) #=> "20 minutes"

	# extends (monkey patches) the Time class:

	Time.now.factual #=> "Today 15:03:29"
	Time.now.ago     #=> "just now"
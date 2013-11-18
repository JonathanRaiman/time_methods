Box Puts
========

Converts time and time intervals to human readable forms.

	TM = TimeMethods
	TM.factual_time(Time.now) #=> "Today"
	TM.time_ago(Time.now-5) #=> "just now"
	TM.relative_time(20*60) #=> "20 minutes"


Usage
-----

To get started `gem install time_methods`, then:

	require 'time_methods'

	TimeMethods.factual_time(Time.now) #=> "Today"
	TimeMethods.time_ago(Time.now-5) #=> "just now"
	TimeMethods.relative_time(20*60) #=> "20 minutes"
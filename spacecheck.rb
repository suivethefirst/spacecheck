require 'HTTParty'

# Set your volume name here (after /Volumes/)

volume = "yourvolume"

free = `df -h /Volumes/"#{volume}" | grep /dev/ | awk '{print $4}'`.strip

posttext = "Spacecheck: #{free} Free"
postdata = {
	text: posttext
}.to_json

# Set the Slack incoming webhook URL in the SPACEWH environment variable

HTTParty.post(ENV["SPACEWH"], :body => postdata)

# put your own credentials here
account_sid = 'AC1166f98fa5122beadf8987038be596a3'
auth_token = '6e298281b2dc85ed455a0e424d42c653'

# set up a client to talk to the Twilio REST API
$twilio_client = Twilio::REST::Client.new account_sid, auth_token

require 'pubnub'

pubnub = Pubnub.new(
     :publish_key   => ENV[‘PUBNUB_PUBLISH_KEY’],
     :subscribe_key => ENV[‘PUBNUB_SUBSCRIBE_KEY’],
     :uuid => 'Cirq Server'
 )

pubnub.subscribe(
    :channel  => 'cirq-test'
 ) { |envelope|
 	while 1 > 0 do
	    puts("
	       \nchannel: #{envelope.channel}:
	       \nmsg: #{envelope.message}
	     ")
	end
 }
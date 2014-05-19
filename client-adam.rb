require 'pubnub'
require 'pry'
require 'robotic-arm'
require 'pi_piper'
 
 pubnub = Pubnub.new(
     :publish_key   => ENV[‘PUBNUB_PUBLISH_KEY’],
     :subscribe_key => ENV[‘PUBNUB_SUBSCRIBE_KEY’]
 )
 
while 1 > 0 
	ra = RoboticArm.new
	pubnub.subscribe(:channel  => 'cirq') { |envelope|
	    puts("#{envelope.message}")
	    case 
	    	when envelope.message == "D" then ra.base.left 0.7
	    	when envelope.message == "C" then ra.base.right 0.7
	    	when envelope.message == "B" then ra.elbow.down 0.7
	    	when envelope.message == "A" then ra.elbow.up 0.7
	    end
	}
end
 

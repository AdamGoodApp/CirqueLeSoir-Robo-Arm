require 'pubnub'
require 'pry'
require 'io/console'
 
 pubnub = Pubnub.new(
     :publish_key   => ENV[‘PUBNUB_PUBLISH_KEY’],
     :subscribe_key => ENV[‘PUBNUB_SUBSCRIBE_KEY’]
 )

 loop do

	# Get a character from STDIN instantly.
	ch = STDIN.getch

	if ch.include? "D"
	  ra.base.left 0.7
	end

	if ch.include? "C"
	  ra.base.right 0.7
	end

	if ch.include? "B"
	  ra.elbow.down 0.3
	end

	if ch.include? "A"
	  ra.elbow.up 0.3
	end

	# if ch.include? "q"
	#   ra.grip.open 0.3
	# end

	# if ch.include? "w"
	#   ra.grip.close 0.3
	# end


end
 
 
 pubnub.subscribe(
    :channel  => 'cirq'
 ) { |envelope|
    puts("
       \nchannel: #{envelope.channel}:
       \nmsg: #{envelope.message}
     ")
 }


binding.pry
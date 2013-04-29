#!/usr/bin/env ruby

require 'socket'

port = ARGV[0].to_i
loops = ARGV[1].to_i
lines = ARGV[2].to_i

socket = TCPSocket.new("localhost", port)

loops.times do |num|
	socket.puts lines
end
loops.times do
	socket.readline
end

#socket.puts "exit"

socket.close


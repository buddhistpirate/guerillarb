#!/usr/bin/env ruby

$LOAD_PATH.unshift "#{__dir__}/../lib"
require "guerillarb"
require "slop"

options = Slop.parse do
	banner "Usage #{$PROGRAM_NAME} [options]"
	on 'd', 'directory',"Source Text Files Directory. Default #{Guerillarb::Guerilla::FIXTURES}", argument: true 
	on 'a', 'address', "address to listen on. Default: #{Guerillarb::Guerilla::DEFAULT_HOSTNAME}", argument: true
	on 'p', 'port', "port to listen on. Default: #{Guerillarb::Guerilla::DEFAULT_PORT}", argument: true
end

options[:port] = options[:port].to_i if options.port?

guerilla = Guerillarb::Guerilla.new options
guerilla.register_traps
guerilla.load_library
guerilla.listen

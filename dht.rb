#!/usr/bin/env ruby

require "optparse"

options = {} # record that holds options parsed from cmd line

optparse = OptionParser.new do |opts|
    opts.banner = "Usage: dht PORT KEY [-o] [-n NBITS] ... "
    options[:offline] = false
    opts.on( '-o', '--offline', 'offline mode' ) do
        options[:offline] = true
    end
    options[:nbits] = nil 
    opts.on( '-n', '--numbits NB', Integer, 'specify max bits' ) do |nb|
        options[:nbits] = nb
    end
    options[:prevkey] = nil 
    options[:nextport] = nil
    options[:nextkey] = nil
    options[:prevport] = nil
    opts.on( '-s', '--details PP PK NP NK', 'spec dets' ) do|pp,pk,np,nk|
        options[:prevport] = pp
        options[:prevkey] = pk
        options[:nextport] = np
        options[:nextkey] = nk
    end
    options[:joinport] = nil
    opts.on( '-j', '--joinport', 'specify join port' ) do |jp|
        options[:joinport] = jp
    end
    opts.on( '-h', '--help', 'Display this screen' ) do
        puts opts
        exit
    end
end

# parse ARGV and remove any options/parameters found
begin
    optparse.parse!

# catch exceptions
rescue OptionParser::MissingArgument
    $stderr.print $!
    exit
end


puts "NBITS is #{options[:nbits]}" if options[:nbits]


# parse command line args
# ARGV.each do|a|
#     puts a
# end

# receive I/O 
$stdin.each_line do |l|
    print l
end

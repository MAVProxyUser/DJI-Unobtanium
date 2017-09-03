#!/usr/bin/env ruby

# Copyright, 2009, 2012, by Samuel G. D. Williams. <http://www.codeotaku.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'rubygems'
require 'rubydns'

$R = Resolv::DNS.new
Name = Resolv::DNS::Name
IN = Resolv::DNS::Resource::IN

RubyDNS.run_server([[:udp, '0.0.0.0', 53]]) do
	# SOA Record
	#   dig @localhost -p 5400 SOA dji.com
	match('dji.com', IN::SOA) do |transaction|
		#
		# For more details about these headers please see:
		#   http://www.ripe.net/ripe/docs/ripe-203.html
		#
		
		transaction.respond!(
			Name.create('ns.dji.com.'),    # Master Name
			Name.create('admin.dji.com.'), # Responsible Name
			File.mtime(__FILE__).to_i,          # Serial Number
			1200,                               # Refresh Time
			900,                                # Retry Time
			3_600_000,                          # Maximum TTL / Expiry Time
			172_800                             # Minimum TTL
		)
		
		transaction.append!(transaction.question, IN::NS, section: :authority)
	end

	# Default NS record
	#   dig @localhost -p 5400 dji.com NS
	match('dji.com', IN::NS) do |transaction|
		transaction.respond!(Name.create('ns.dji.com.'))
	end

	# For this exact address record, return an IP address
	#   dig @localhost -p 5400 CNAME bob.dji.com
	match(/([^.]+).dji.com/, IN::CNAME) do |transaction|
		transaction.respond!(Name.create('www.dji.com'))
		transaction.append!('www.dji.com', IN::A)
	end

	match('80.0.0.10.in-addr.arpa', IN::PTR) do |transaction|
		transaction.respond!(Name.create('www.dji.com.'))
	end

	match('www.dji.com', IN::A) do |transaction|
		transaction.respond!('10.0.0.80')
	end

	match('ns.dji.com', IN::A) do |transaction|
		transaction.respond!('10.0.0.10')
	end

	# Default DNS handler
	otherwise do |transaction|
		# Non-Existant Domain
		transaction.fail!(:NXDomain)
	end
end

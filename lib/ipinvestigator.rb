# Using URI and Net:HTTP which are already included with Rails

class Ipinvestigator

def self.checkip

uri = URI('https://ipinvestigator.expeditedaddons.com')

ipuri= URI('https://api.myip.com')

ip = JSON.parse(Net::HTTP.get_response(ipuri).body)

uri.query = URI.encode_www_form({
	api_key: '977G4WCO81RH6I6MK0AB42TQD052X1SYVZ9PL3UJEFN358',
	ip: ip['ip']
})

# Results are returned as a JSON object
result = JSON.parse(Net::HTTP.get_response(uri).body)

# For reference, here are all the outputs
flag = false
# Is this IP on a blocklist
if result['is_listed']
 flag = true
# The number of blocklists the IP is listed on
elsif result['list_count']
 flag = true
# The last time this IP was seen on a blocklist (in Unix time or 0 if not listed recently)
#result['last_seen']
# IP has been detected as an anonymous web proxy or anonymous HTTP proxy
elsif result['is_proxy']
 flag = true
# IP is coming from a Tor node
elsif result['is_tor']
 flag = true
# IP has been detected as coming from a VPN hosting provider
elsif result['is_vpn']
 flag = true
# IP is involved in distributing malware
elsif result['is_malware']
 flag = true
# IP is being used by spyware, malware, botnets or for other malicious activities
elsif result['is_spyware']
 flag = true
# IP has been flagged on DShield (dshield.org)
elsif result['is_dshield']
 flag = true
# hijacked netblocks or netblocks controlled by criminal organizations
elsif result['is_hijacked']
 flag = true
# IP is a hostile spider or crawler
elsif result['is_spider']
 flag = true
# IP is hosting a malicious bot or is part of a botnet
elsif result['is_bot']
 flag = true
# IP address is hosting a spam bot, comment spamming or other spamming software
elsif result['is_spam_bot']
 flag = true
# IP is hosting an exploit finding bot or exploit scanning software
elsif result['is_exploit_bot']
 flag = true

else
	flag = false
end
puts '------------------------checking ip---------------------------------------------'
puts '------------------------checking ip---------------------------------------------'
puts '------------------------checking ip---------------------------------------------'
puts result
puts '------------------------checking ip---------------------------------------------'
puts '------------------------checking ip---------------------------------------------'
puts '------------------------checking ip---------------------------------------------'
return flag
end

end
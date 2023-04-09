#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'

require './message'

SERVER = '192.168.16.125'

webhooks = {
  "unit2 front door": "keycard-swipe-unit2-front",
            "unit3 front door": "keycard-swipe-unit3-front",
            "unit3 back door": "keycard-swipe-unit3-back",
            "laser-access": "laser"
}

message = STDIN.read

m = Message.new message
msg = {
  door: m.door,
  person: m.person,
  action: m.action,
  timestamp: m.timestamp,
  section: m.section,
  text: message
}

webhook = webhooks[m.door.to_sym]

url = "http://#{SERVER}/api/webhook/#{webhook}"

puts url
puts msg.to_json

uri = URI.parse(url)
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.request_uri, {'Content-Type': 'text/json'})
request.body = msg.to_json

response = http.request(request)

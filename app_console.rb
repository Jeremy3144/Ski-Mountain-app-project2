require 'pry'
require 'pg'

require_relative 'lib'
require_relative 'models/mountain'


test = get_all_mountains()

test.each do |mt|
  puts mt["name_of_mt"]
end
binding.pry
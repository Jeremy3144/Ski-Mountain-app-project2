require 'pry'
require 'pg'

require_relative 'lib'
require_relative 'models/mountain'
# require_relative 'lib'





5.times do |n|
  create_mountain(
    "hak#{n}", "jap#{n}", "awdawdawdawd#{n}", "beg#{n}", "cat#{n}", "favR#{n}", 1, 0
  )
end



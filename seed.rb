require 'pry'
require 'pg'

require_relative 'lib'
require_relative 'models/mountain'
# require_relative 'lib'





20.times do |n|
  create_mountain(
    "hak#{n}", "jap#{n}", "awdawdawdawd#{n}", "beg#{n}", "https://www.powderhounds.com/site/DefaultSite/filesystem/images/Japan/HakubaHappo/Overview/01.jpg", "favR#{n}", 1
  )
end



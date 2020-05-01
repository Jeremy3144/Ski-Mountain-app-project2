require 'pry'
require 'pg'

require_relative 'lib'
require_relative 'models/mountain'
require_relative 'models/votes'
require_relative 'models/user'
require_relative 'models/comments'





# 12.times do |n|
#   create_mountain(
#     "happo one#{n}", "Japan#{n}", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat praesentium dolor distinctio ipsa nobis voluptas modi, placeat maiores totam quasi? Rem sint dolore reprehenderit tempora ut! Perferendis temporibus laboriosam excepturi.#{n}", "All round", "https://www.powderhounds.com/site/DefaultSite/filesystem/images/Japan/HakubaHappo/Overview/01.jpg", "Happo", 1
#   )
# end



22.times do 
  add_vote(2, 1, "up")
end


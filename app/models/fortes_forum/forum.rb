module FortesForum
  class Forum < ActiveRecord::Base
    include FortesForum::Default::Forum
    has_many :posts
  end
end

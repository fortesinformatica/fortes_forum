module FortesForum
  class Comment < ActiveRecord::Base
    include FortesForum::Default::Comment
  end
end
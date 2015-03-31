module FortesForum
  class Forum < ActiveRecord::Base
    include FortesForum::Default::Forum
  end
end

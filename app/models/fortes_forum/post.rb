module FortesForum
  class Post < ActiveRecord::Base
    include FortesForum::Default::Post

    belongs_to :user
    belongs_to :forum
  end
end


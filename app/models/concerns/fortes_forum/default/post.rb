module FortesForum
  module Default
    module Post
      extend ActiveSupport::Concern

      included do
        belongs_to :user
        belongs_to :forum
        has_many :replies, dependent: :destroy

      end
    end
  end
end

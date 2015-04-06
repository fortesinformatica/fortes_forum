module FortesForum
  module Default
    module Reply
      extend ActiveSupport::Concern

      included do
        belongs_to :post
      end
    end
  end
end

module FortesForum
  module Default
    module Post
      extend ActiveSupport::Concern

      included do
        belongs_to :user
        belongs_to :forum
        has_many :replies, dependent: :destroy

        before_save :verifica_permissao!

        def verifica_permissao!
          true
        end
      end
    end
  end
end

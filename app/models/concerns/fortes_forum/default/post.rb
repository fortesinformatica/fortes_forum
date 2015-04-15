module FortesForum
  module Default
    module Post
      extend ActiveSupport::Concern

      included do
        belongs_to :user
        belongs_to :forum
        has_many :replies, dependent: :destroy

        validates_presence_of :conteudo, :user_id, :forum_id

        before_save :verifica_permissao!

        def verifica_permissao!
          true
        end
      end
    end
  end
end

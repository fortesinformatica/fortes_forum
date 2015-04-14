module FortesForum
  module Default
    module Reply
      extend ActiveSupport::Concern

      included do
        belongs_to :post
        belongs_to :user
        has_many :comments, dependent: :destroy

        before_save :verifica_permissao!

        def verifica_permissao!
          true
        end

        def replies_nao_sincronizados ultimo_id_sincronizado=0
          ultimo_id_sincronizado=0 if ultimo_id_sincronizado.empty?
          FortesForum::Reply.where(post_id: self.post_id).where("id > ?", ultimo_id_sincronizado)
        end
      end
    end
  end
end

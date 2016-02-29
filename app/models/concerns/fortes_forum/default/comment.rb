module FortesForum
  module Default
    module Comment
      extend ActiveSupport::Concern

      included do
        belongs_to :reply
        belongs_to :user

        validates_presence_of :conteudo, :user_id, :reply_id

        validate :verifica_permissao!

        def verifica_permissao!
          true
        end

        def comments_nao_sincronizados ultimo_id_sincronizado=0
          ultimo_id_sincronizado=0 if ultimo_id_sincronizado.empty?
          FortesForum::Comment.where(reply_id: self.reply_id, moderado: false).where("id > ?", ultimo_id_sincronizado)
        end
      end
    end
  end
end

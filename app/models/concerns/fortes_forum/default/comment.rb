module FortesForum
  module Default
    module Comment
      extend ActiveSupport::Concern

      included do
        belongs_to :reply
        belongs_to :user

        def comments_nao_sincronizados ultimo_id_sincronizado=0
          ultimo_id_sincronizado=0 if ultimo_id_sincronizado.empty?
          FortesForum::Comment.where(reply_id: self.reply_id).where("id > ?", ultimo_id_sincronizado)
        end
      end
    end
  end
end
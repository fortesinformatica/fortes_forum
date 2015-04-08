module FortesForum
  module Default
    module Comment
      extend ActiveSupport::Concern

      included do
        belongs_to :reply
        belongs_to :user

        attr_accessor :ultimo_id_sincronizado

        def comments_nao_sincronizados
          self.ultimo_id_sincronizado = 0 unless self.ultimo_id_sincronizado.present?
          FortesForum::Comment.where(reply_id: self.reply_id).where("id > ?", self.ultimo_id_sincronizado)
        end
      end
    end
  end
end

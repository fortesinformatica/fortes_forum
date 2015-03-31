module FortesForum
  module Default
    module Forum
      extend ActiveSupport::Concern

      included do
        def self.get_descricao
          "Não Implementado ######"
        end
      end
    end
  end
end

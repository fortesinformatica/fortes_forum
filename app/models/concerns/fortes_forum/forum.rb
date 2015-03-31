module FortesForum::Default::Forum
  extend ActiveSupport::Concern

  included do
    def self.get_descricao
      "Não Implementado ######"
    end
  end
end

#FortesForum::Forum.class_eval do

#end
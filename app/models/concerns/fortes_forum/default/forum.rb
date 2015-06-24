module FortesForum
  module Default
    module Forum
      extend ActiveSupport::Concern

      included do
        has_many :posts, dependent: :destroy

        def self.get_or_create params
          @forum = where(params).first
          @forum = create(params) unless @forum.present?
          @forum
        end

        def permite_acessar? user
          true
        end

        def permite_excluir? user
          true
        end
      end
    end
  end
end

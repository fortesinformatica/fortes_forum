module FortesForum
  module Default
    module Forum
      extend ActiveSupport::Concern

      included do
        def self.get_or_create params
          @forum = where(params).first
          @forum = create(params) unless @forum.present?
          @forum
        end
      end
    end
  end
end

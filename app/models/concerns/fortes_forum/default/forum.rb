module FortesForum
  module Default
    module Forum
      extend ActiveSupport::Concern

      included do
        def self.get_or_create params
          @forum = where(params)
          @forum = create(params) if @forum.empty?
          @forum
        end
      end
    end
  end
end

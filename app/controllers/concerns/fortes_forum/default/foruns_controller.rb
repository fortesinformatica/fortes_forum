module FortesForum
  module Default
    module ForunsController
      extend ActiveSupport::Concern

      def foruns_params params
        {id: params[:id]}
      end
    end
  end
end
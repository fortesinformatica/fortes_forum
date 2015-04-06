module FortesForum::Default
  module ForunsController
    extend ActiveSupport::Concern

    included do
      respond_to :html, :json

      skip_filter :authenticate_user!

      def index
        @post = FortesForum::Post.new
        @forum = FortesForum::Forum.get_or_create foruns_params(params)
        respond_with @forum
      end

      def foruns_params params
        {id: params[:id]}
      end
    end
  end
end
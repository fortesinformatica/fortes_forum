module FortesForum::Default
  module PostsController
    extend ActiveSupport::Concern

    included do
      respond_to :html, :json

      skip_filter :authenticate_user!

      def create
        @post = FortesForum::Post.create({ user_id: current_user.try(:id), forum_id: params[:forum_id], conteudo: params[:conteudo] })
        respond_with @post
      end

    end
  end
end
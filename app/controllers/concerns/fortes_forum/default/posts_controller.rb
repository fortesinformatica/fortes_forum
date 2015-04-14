module FortesForum::Default
  module PostsController
    extend ActiveSupport::Concern

    included do
      respond_to :html, :json

      skip_filter :authorize_user!

      def create
        @post = FortesForum::Post.create({ user_id: current_user.try(:id), forum_id: params[:fortes_forum_post][:forum_id], conteudo: params[:fortes_forum_post][:conteudo] })
        redirect_to @post
      end

      def show
        @post = FortesForum::Post.find_by(id: params[:id])
        respond_with @post
      end
    end
  end
end
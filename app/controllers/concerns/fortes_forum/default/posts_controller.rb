module FortesForum::Default
  module PostsController
    extend ActiveSupport::Concern

    included do
      respond_to :html, :json

      skip_filter :authorize_user!

      def create
        @post = FortesForum::Post.create({ user_id: current_user.try(:id), forum_id: params[:fortes_forum_post][:forum_id], conteudo: params[:fortes_forum_post][:conteudo] })
        if @post.id
          redirect_to @post
        else
          @error = "Sem permissão para postar neste fórum."
          render :unauthorized
        end
      end

      def show
        @post = FortesForum::Post.find_by(id: params[:id])
        respond_with @post
      end
    end
  end
end
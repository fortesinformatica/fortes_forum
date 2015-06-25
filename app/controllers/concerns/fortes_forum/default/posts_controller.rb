module FortesForum::Default
  module PostsController
    extend ActiveSupport::Concern

    included do
      respond_to :html, :json

      skip_filter :authorize_user!

      def create
        @post = FortesForum::Post.create({ user_id: current_user.try(:id), forum_id: params[:fortes_forum_post][:forum_id], conteudo: params[:fortes_forum_post][:conteudo] })
        if @post.valid?
          redirect_to @post
        else
          redirect_to(:back, flash: { alert: @post.errors.messages })
        end
      end

      def show
        @post = FortesForum::Post.find_by(id: params[:id])
        respond_with @post
      end

      def destroy
        @post = FortesForum::Post.find_by(id: params[:id])
        if @post.forum.permite_excluir? current_user
          @post.update(moderado: true)
          respond_with @post
        else
          redirect_to(:back, flash: { alert: "usuário não tem permissão para moderar o fórum" })
        end
      end
    end
  end
end

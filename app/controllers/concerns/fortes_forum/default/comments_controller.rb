module FortesForum::Default
  module CommentsController
    extend ActiveSupport::Concern

    included do
      respond_to :html, :json
      skip_filter :authorize_user!

      def create
        @comment = FortesForum::Comment.create({ user_id: current_user.try(:id), reply_id: params[:reply_id], conteudo: params[:conteudo]  })

        if @comment.valid?
          render partial: 'fortes_forum/posts/comments', locals: { comments: @comment.comments_nao_sincronizados(params[:ultimoIdSincronizado]) }
        else
          render partial: 'fortes_forum/application/alerts', :status => :unauthorized, locals: { flash: { alert: @comment.errors.messages } }
        end
      end

      def destroy
        @comment = FortesForum::Comment.find_by(id: params[:id])
        if @comment.reply.post.forum.permite_excluir? current_user
          @comment.update(moderado: true)
          respond_with @comment
        else
          redirect_to(:back, flash: { alert: "usuário não tem permissão para moderar o fórum" })
        end
      end
    end
  end
end

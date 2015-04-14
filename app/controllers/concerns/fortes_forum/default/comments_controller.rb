module FortesForum::Default
  module CommentsController
    extend ActiveSupport::Concern

    included do
      respond_to :html, :json
      skip_filter :authorize_user!

      def create
        @comment = FortesForum::Comment.create({ user_id: current_user.try(:id), reply_id: params[:reply_id], conteudo: params[:conteudo]  })

        if @comment.id
          render partial: 'fortes_forum/posts/comments', locals: { comments: @comment.comments_nao_sincronizados(params[:ultimoIdSincronizado]) }
        else
          @error = "Sem permissão para postar neste fórum."
          render :unauthorized
        end
      end
    end
  end
end
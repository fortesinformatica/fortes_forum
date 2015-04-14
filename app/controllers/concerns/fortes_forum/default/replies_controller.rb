module FortesForum::Default
  module RepliesController
    extend ActiveSupport::Concern

    included do
      respond_to :html, :json

      skip_filter :authorize_user!

      def create
        @reply = FortesForum::Reply.create({ user_id: current_user.try(:id), post_id: params[:post_id], conteudo: params[:conteudo]  })

        if @reply.id
          render partial: 'fortes_forum/posts/reply', locals: { replies: @reply.replies_nao_sincronizados(params[:ultimoIdSincronizado]) }
        else
          @error = "Sem permissão para postar neste fórum."
          render :unauthorized
        end
      end
    end
  end
end
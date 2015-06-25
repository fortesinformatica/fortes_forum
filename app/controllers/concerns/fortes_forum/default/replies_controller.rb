module FortesForum::Default
  module RepliesController
    extend ActiveSupport::Concern

    included do
      respond_to :html, :json

      skip_filter :authorize_user!

      def create
        @reply = FortesForum::Reply.create({ user_id: current_user.try(:id), post_id: params[:post_id], conteudo: params[:conteudo]  })

        if @reply.valid?
          render partial: 'fortes_forum/posts/reply', locals: { replies: @reply.replies_nao_sincronizados(params[:ultimoIdSincronizado]) }
        else
          render partial: 'fortes_forum/application/alerts', :status => :unauthorized, locals: { flash: { alert: @reply.errors.messages } }
        end
      end

      def destroy
        @reply = FortesForum::Reply.find_by(id: params[:id])
        if @reply.post.forum.permite_excluir? current_user
          @reply.update(moderado: true)
          respond_with @reply
        else
          redirect_to(:back, flash: { alert: "usuário não tem permissão para moderar o fórum" })
        end
      end
    end
  end
end

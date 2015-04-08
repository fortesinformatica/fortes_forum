module FortesForum::Default
  module RepliesController
    extend ActiveSupport::Concern

    included do
      respond_to :html, :json

      skip_filter :authenticate_user!

      def create
        @reply = FortesForum::Reply.create({ user_id: current_user.try(:id), post_id: params[:post_id], conteudo: params[:conteudo]  })
        render partial: 'fortes_forum/posts/reply', locals: { replies: @reply.replies_nao_sincronizados(params[:ultimoIdSincronizado]) }
      end

    end
  end
end
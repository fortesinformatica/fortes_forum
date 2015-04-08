module FortesForum::Default
  module CommentsController
    extend ActiveSupport::Concern

    included do
      respond_to :html, :json

      skip_filter :authenticate_user!

      def create
        @comment = FortesForum::Comment.create({ user_id: current_user.try(:id), reply_id: params[:reply_id], conteudo: params[:conteudo]  })
        @comment.ultimo_id_sincronizado = params[:ultimoIdSincronizado]
        respond_with @comment, methods: [:comments_nao_sincronizados]
      end
    end
  end
end
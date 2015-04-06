module FortesForum::Default
  module RepliesController
    extend ActiveSupport::Concern

    included do
      respond_to :html, :json

      skip_filter :authenticate_user!

      def create
        @reply = FortesForum::Reply.create({ user_id: current_user.try(:id), post_id: params[:post_id], conteudo: params[:conteudo]  })
        respond_with @reply
      end
    end
  end
end
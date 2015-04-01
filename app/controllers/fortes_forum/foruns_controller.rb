class FortesForum::ForunsController < ApplicationController
  include FortesForum::Default::ForunsController

  respond_to :html, :json

  skip_filter :authenticate_user!

  def index
    @forum = FortesForum::Forum.get_or_create foruns_params(params)
    respond_with @forum
  end
end
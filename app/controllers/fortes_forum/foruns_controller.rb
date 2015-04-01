class ForunsController < ApplicationController
  skip_filter :authentication_user!

  def index
    @forum = FortesForum::Forum.get_or_create foruns_params(params)
    respond_with @forum
  end

  private
  def foruns_params params
    {id: params[:id]}
  end
end
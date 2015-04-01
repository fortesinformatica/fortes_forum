class ForunsController < ApplicationController
  def index
    @forum = FortesForum::Forum.get_or_create foruns_params(params)
    respond_with @forum
  end

  private
  def foruns_params params
    {id: params[:id]}
  end
end
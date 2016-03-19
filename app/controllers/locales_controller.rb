class LocalesController < ApplicationController
  def update
    session[:locale] = params[:locale]
    head :no_content
  end
end

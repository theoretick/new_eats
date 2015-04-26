class LocalesController < ApplicationController

  def index
    render json: Locale.all
  end

  def show
    locale = Locale.find_by(id: params[:id])
    if locale
      render json: locale
    else
      render json: {}, status: 404
    end
  end
end
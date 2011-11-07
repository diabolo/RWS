class ServicesController < ApplicationController
  
  respond_to :json

  def create
    @service = Service.create(params[:service])
    respond_with(@service)
  end

  def show
  end
end

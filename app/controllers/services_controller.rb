class ServicesController < ApplicationController
  
  respond_to :json

  def create
    @service = Service.create(params[:service])
    if @service.valid?
      respond_with(@service) 
    else
      render(:action => :usage, :status => :unprocessable_entity)
    end
  end

  def show
  end
end

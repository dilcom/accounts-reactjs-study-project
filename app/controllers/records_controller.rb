class RecordsController < ApplicationController
  helper_method :resources, :resource

  def index; end

  def create
    if build_resource.save
      render json: resource
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  def destroy
    resource.destroy
    head :no_content
  end

  def update
    if resource.update_attributes(resource_params)
      render json: resource
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  protected

    def resource_association
      Record.all
    end

    def resources
      resource_association
    end

    def resource
      @resource ||= resource_association.find(params[:id])
    end

    def build_resource
      @resource = resource_association.build(resource_params)
    end

    def resource_params
      params.require(:record).permit(:title, :date, :amount)
    end
end

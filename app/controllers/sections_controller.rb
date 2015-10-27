class SectionsController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new()
  end

  def edit
    @section = Section.find(params[:id])
  end

  def delete
    @section = Section.find(params[:id])
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section #{@section.name} created seccessfully!"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def update
    @section = Section.find(params[:id])
    @section.update_attributes(section_params)
    if @section.save
      flash[:notice] = "Section #{@section.name} updated seccessfully!"
      redirect_to(:action => 'show', :id => @section.id)
    else
      render('edit')
    end
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "Section #{section.name} destroyed seccessfully!"
    redirect_to(:action => 'index')
  end

  private
  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end

end

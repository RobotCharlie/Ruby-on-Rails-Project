class PagesController < ApplicationController

  layout "admin"

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new({:name => "Default"})
    @page_count = Page.count+1
    @subject = Subject.order('position ASC')
  end

  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count
    @subject = Subject.order('position ASC')
  end

  def delete
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page #{@page.name} created successfully!"
      redirect_to(:action => 'index')
    else
      @page_count = Page.count+1
      @subject = Subject.order('position ASC')
      render('new')
    end
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page #{@page.name} updated successfully!"
      redirect_to(:action => 'show', :id => @page.id)
    else
      @page_count = Page.count+1
      @subject = Subject.order('position ASC')
      render('edit')
    end
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page #{page.name} delete succesfully!"
    redirect_to(:action => 'index')
  end

  private
  def page_params
    params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
  end

end

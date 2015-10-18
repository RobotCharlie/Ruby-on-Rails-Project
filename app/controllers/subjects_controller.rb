class SubjectsController < ApplicationController

  layout false

  def index
    @subjects = Subject.sorted # Here the Subject is a model class
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(:name=>"Default")
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def create
    # Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
      flash[:notice] = "Subject created successfully!"
      # If save succeeds, redirect to the index action
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can dix problems
      render('new')
    end
  end

  def update
    # Find an existing object using form parameters
    @subject = Subject.find(params[:id])
    @subject.update_attributes(subject_params)
    # Update the object
    if @subject.save
      flash[:notice] = "Subject updated successfully!"
      # If update succeeds, redirect to the index action
      redirect_to(:action => 'show',:id => @subject.id)
    else
      # If update fails, redisplay the form so user can dix problems
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    #Since the action will never display a template,there is no reason
    # to use an instance variable, so we just use a local variable
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' destroyed successfully!"
    redirect_to(:action => 'index')
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end

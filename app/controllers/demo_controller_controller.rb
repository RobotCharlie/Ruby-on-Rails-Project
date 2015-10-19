class DemoControllerController < ApplicationController

  layout false

  # The following codes are named action
  def index_view1
    #render(:template => 'demo_controller/hello')
    #render('demo_controller/hello')
    #render('hello')

    @id = params[:id].to_i
    @page = params[:page].to_i

  end

  def hello
    @array = [1,2,3,4,5]
  end

  def other_hello
    redirect_to(:controller => 'demo_controller', :action => 'index_view1')
  end

  def google
    redirect_to("http://www.google.ca")
  end

  def escape_output
  end
  
end

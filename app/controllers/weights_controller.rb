class WeightsController < ApplicationController
  include AuthenticatedSystem
  before_filter :authorize

  def index
    @weights = Weight.find(:all, :order => 'date', :conditions => {:user_id => session[:user_id]})
  end

  def show
    @weight = Weight.find(params[:id], :order => 'date', :conditions => {:user_id => session[:user_id]})
  end

  def new
    @weight = Weight.new
    @weight.user_id = session[:user_id]
  end

  def edit
    @weight = Weight.find(params[:id], :conditions => {:user_id => session[:user_id]})
  end

  def create
    @weight = Weight.new(params[:weight])
    @weight.user_id = session[:user_id]

    if @weight.save
      flash[:notice] = 'Weight was successfully created.'
      redirect_to(@weight)
    else
      render :action => "new"
    end

  end

  def update
    @weight = Weight.find(params[:id], :conditions => {:user_id => session[:user_id]})

    if @weight.update_attributes(params[:weight])
      flash[:notice] = 'Weight was successfully updated.'
      redirect_to(@weight)
    else
      render :action => "edit"
    end
  end

  def destroy
    @weight = Weight.find(params[:id], :conditions => {:user_id => session[:user_id]})
    @weight.destroy

    redirect_to(weights_url)
  end

  private
  def authorize

    unless request.path == '/' ||
            request.path == '/signup' ||
            request.path == '/register' ||
            User.find_by_id(session[:user_id])
      flash[:notice] = 'Efetue o login'
      redirect_to :root
    end
  end

end
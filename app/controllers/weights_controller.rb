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
    date = params[:weight][:date]
    @weight.date = DateTime.new(date[6..9].to_i, date[3..4].to_i, date[0..1].to_i)

    puts @weight.to_json

    if @weight.save
      redirect_to profile_path
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

end
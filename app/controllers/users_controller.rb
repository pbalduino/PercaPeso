class UsersController < ApplicationController
  include AuthenticatedSystem

  before_filter :authorize, :only => :edit

  def new
    @user = User.new
  end

  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      reset session
      self.current_user = @user # !! now logged in
      redirect_to profile_path
      flash[:notice] = "Obrigado por se cadastrar"
    else
      flash[:error] = "Ocorreu um problema ao criar sua conta. Tente de novo ou contate o admin."
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(session[:user_id])
    @weights = Weight.find(:all, :order => :date, :limit => 5, :conditions => {:user_id => session[:user_id]})
  end
end
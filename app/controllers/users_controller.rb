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
      # reset session
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
    @weight = Weight.new
    @weights = Weight.find(:all, :order => 'date DESC', :limit => 5, :conditions => {:user_id => session[:user_id]})
    @first_weight = Weight.first(:order => :date, :conditions => {:user_id => session[:user_id]})
  end

  def ajax_update
    @user = User.find(session[:user_id])
    @user[params[:field].sub('#', '')] = params[:value]
    @user.save!

    render :json => 'ok', :status => 200
  end

  def ranking

    data = [];

    User.find(:all, :select => 'id, name, login, height', :conditions => {:id => [1, 3, 6, 8, 9]}).each do |user|
      first = Weight.find(:all, :select => 'user_id, weight', :conditions => {:user_id => user.id}, :order => 'date').first

      initial = (Weight.find(:all, :select => 'user_id, weight', :conditions => {:user_id => user.id}, :order => 'date').first.weight.to_f / ((user.height.to_f / 100) ** 2))
      final = (Weight.find(:all, :select => 'user_id, weight', :conditions => {:user_id => user.id}, :order => 'date').last.weight.to_f / ((user.height.to_f / 100) ** 2))
      row = {:name => !user.name.empty? ? user.name : user.login,
             :height => user.height,
             :delta => (1 - (final.to_f / initial.to_f)) * 100}

      data << row
    end

    data.sort!{|a, b | a[:delta]> b[:delta] ? -1 : 1}

    render :xml => data
  end
end
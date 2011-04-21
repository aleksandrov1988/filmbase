class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  protect_from_forgery

  before_filter :check_user

  private
  def check_user
    @current_user=current_user
  end

  def check_regular_user
    unless @current_user
      render :text=>"Доступ для незарегистрированных пользователей запрещен", :layout => 'application'
    end
  end

  def check_admin_user
    unless @current_user && @current_user.admin?
      render :text=>"Доступ запрещен", :layout => 'application'
    end
  end
end

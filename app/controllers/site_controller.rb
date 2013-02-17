class SiteController < ApplicationController

  skip_before_filter :require_login, :require_admin

  def index
    if logged_in?
      render "dashboard/show"
    end
  end
end

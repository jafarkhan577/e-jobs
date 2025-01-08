# app/helpers/application_helper.rb
module ApplicationHelper
    def current_user_signed_in?
      user_signed_in?
    end
  end
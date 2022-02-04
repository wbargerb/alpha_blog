class ApplicationController < ActionController::Base
  def home
    render html: 'this is home!!!'
  end

  def about
    render html: 'This is about'
  end
end

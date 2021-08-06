class ApplicationController < ActionController::Base
  def hello
    render html:"The World!!!"
  end
end

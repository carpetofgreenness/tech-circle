class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def hello
    render html: "hello, world!"
  end
end

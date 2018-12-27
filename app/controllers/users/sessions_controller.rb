class Users::SessionsController < Devise::SessionsController

  def index
    @test = "hello"
  end

  def edit
  end

end

require 'spec_helper'
require 'rails_helper'

describe SessionsController do
  def create_user
    @user = User.create(name: "admin", email: "admin@gmail.com",password: "default123")
  end

  it "should create session user" do
    create_user
    post :create, session: {email: 'admin@gmail.com',password: 'default123'}
    expect session[:user_id].present?
    expect '/'
  end
end
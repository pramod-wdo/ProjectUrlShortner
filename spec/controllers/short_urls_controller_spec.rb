require 'spec_helper'
require 'rails_helper'

describe ShortUrlsController do
  def login_user
    @user = User.create(name: "admin", email: "admin@gmail.com",password: "default123")
    session[:user_id] = @user.id
  end

  it "should authenticate user" do
    get :index
    expect login_path
  end

  it "should be logged in and should get index" do
    login_user
    get :index
    expect :success
    expect !assigns(:short_urls).nil?
  end

  it "should be logged in and should get new" do
    login_user
    get :new
    expect :success
    expect !assigns(:short_url).nil?
  end

end

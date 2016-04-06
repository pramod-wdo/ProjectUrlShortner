require 'spec_helper'
require 'rails_helper'

describe UsersController do

  def valid_attributes
    { name: "admin",
     email: "admin@gmail.com",
     password: "default123"
    }
  end

  describe "GET index" do
    it "lists all users" do
      user = User.create! valid_attributes
      get :index
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :edit, :id => user.id
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new user" do
        expect {
          xhr :post, :create, user: valid_attributes
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        xhr :post, :create, user: valid_attributes
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end
    end
  end
end


require 'spec_helper'
require 'rails_helper'

describe ShortVisitsController do

  before do
    @user = User.create(name: "admin", email: "admin@gmail.com",password: "default123")
    @user.short_urls.create(original_url: "http://gmail.com/")
    session[:user_id] = @user.id
  end

  def valid_attributes
    {
      short_url_id: 1,
      visitor_ip: "1.1.1.1",
      visitor_country_iso2: "India",
    }
  end

  it  "should authenticate to the user" do
    get :show
    expect login_path
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new short visit" do
        expect {
          xhr :post, :create, short_user: valid_attributes
        }.to change(ShortVisit, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        xhr :post, :create, short_visit: valid_attributes
        expect(assigns(:short_visit)).to be_a(ShortVisit)
        expect(assigns(:short_visit)).to be_persisted
      end
    end
  end
end

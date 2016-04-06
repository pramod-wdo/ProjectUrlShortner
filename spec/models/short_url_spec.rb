require 'spec_helper'
require 'rails_helper'

describe ShortUrl do
  before do
    @user = User.create(name: "admin", email: "admin@gmail.com",password: "default123")
  end

  it "checks for urls presence" do
    short_url=@user.short_urls.new(original_url: nil)
    expect short_url.invalid?
  end

  it "should be valid" do
    short_url=@user.short_urls.new(original_url: "http://gmail.com/")
    expect short_url.valid?
  end

  it "should check users presence" do
    short_url=ShortUrl.new(original_url: "http://gmail.org/")
    expect !short_url.valid?
  end

end

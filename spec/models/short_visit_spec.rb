require 'spec_helper'
require 'rails_helper'

describe ShortVisit do
  before do
    @user = User.create(name: "admin", email: "admin@gmail.com",password: "default123")
    @short_url=@user.short_urls.new(original_url: "http://gmail.com/")
  end

  it 'should be valid' do
    short_visit=@short_url.short_visits.new
    expect short_visit.valid?
  end

  it 'should be invalid' do
    short_visit=ShortVisit.new()
    expect !short_visit.valid?
  end

end

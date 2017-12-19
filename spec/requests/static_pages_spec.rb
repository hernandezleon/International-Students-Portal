require 'spec_helper'
require 'rails_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have the content 'International'" do
      visit '/static_pages/home'
      page.should have_content('International')
    end
  end
end

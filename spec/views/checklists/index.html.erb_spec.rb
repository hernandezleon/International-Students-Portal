require 'rails_helper'

RSpec.describe "checklists/index", type: :view do
  before(:each) do
    assign(:checklists, [
      Checklist.create!(),
      Checklist.create!()
    ])
  end

  it "renders a list of checklists" do
    render
  end
end

require 'rails_helper'

RSpec.describe "notes/index", type: :view do
  before(:each) do
    assign(:notes, [
      Note.create!(
        :content => "Content"
      ),
      Note.create!(
        :content => "Content"
      )
    ])
  end

  it "renders a list of notes" do
    render
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end

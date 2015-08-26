require File.dirname(__FILE__) + '/../acceptance_helper'

describe 'home page' do
  it "shows download links" do
    visit '/'
    expect(page).to have_selector('#iso a.button', :text => 'Download ISO')
    expect(page).to have_selector('#patch a.button', :text => 'Instructions')
  end
end

describe 'stylesheet' do
  it "is returned" do
    visit '/screen.css'
    expect(page.status_code).to eq(200)
  end
end
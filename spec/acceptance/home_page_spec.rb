require File.dirname(__FILE__) + '/../acceptance_helper'

describe 'home page' do  
  it "shows download links" do
    visit '/'
    page.should have_selector('#iso a.button', :text => 'Download ISO')
    page.should have_selector('#patch a.button', :text => 'Download script')
  end
end

describe 'stylesheet' do
  it "is returned" do
    visit '/screen.css'
    page.status_code.should == 200
  end
end
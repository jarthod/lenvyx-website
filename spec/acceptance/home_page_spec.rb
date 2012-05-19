require File.dirname(__FILE__) + '/../acceptance_helper'

describe 'home page' do  
  it "shows download link" do
    visit '/'
    page.should have_selector('#iso a.button', :text => 'Download ISO')
  end
end
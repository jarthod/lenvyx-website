require File.dirname(__FILE__) + '/../acceptance_helper'

describe 'download' do
  before :all do
    set :public_folder, 'spec/public'
    RELEASES.stub!(:last).and_return({:name => 'test'})
  end

  it 'should return valid file and store stats' do
    expect {
      visit '/download'
      page.status_code.should == 200
    }.to change(Download, :count).by(1)
  end
end  
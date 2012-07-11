require File.dirname(__FILE__) + '/../acceptance_helper'

describe 'download' do
  before :all do
    set :public_folder, 'spec/public'
  end

  it 'should return last release file and store stats' do
    expect {
      RELEASES.should_receive(:last).and_return({:name => 'test'})
      visit '/download'
      page.status_code.should == 200
    }.to change(Download, :count).by(1)
  end

  it 'should return given version' do
    expect {
      RELEASES.should_receive(:select).and_return([{:name => 'test'}])
      visit '/download/1.0-alpha'
      page.status_code.should == 200
    }.to change(Download, :count).by(1)
  end

  it 'should redirect to home on unknown version' do
    expect {
      visit '/download/0.2-unknown'
      page.status_code.should == 404
    }.not_to change(Download, :count)
  end
end  
require 'spec_helper'

describe Model2Factory do
  it 'has a version number' do
    expect(Model2Factory::Rails::Version::STRING).not_to be nil
  end
end

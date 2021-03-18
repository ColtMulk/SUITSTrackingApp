require 'rails_helper'

RSpec.describe Users::RegistrationsController, :type => :controller do
  login_admin

  it 'should have a current user' do
    expect(subject.current_user).to_not eq(nil)
  end
  
end

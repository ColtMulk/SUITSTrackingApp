require 'rails_helper'

RSpec.describe Users::RegistrationsController, :type => :controller do
  login_user

  it 'should have a current user' do
    expect(subject.current_user).to_not eq(nil)
  end

end

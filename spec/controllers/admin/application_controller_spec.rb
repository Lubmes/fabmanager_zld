require 'rails_helper'

RSpec.describe Admin::ApplicationController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  before do
    allow(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:current_user).and_return(user)
  end

  context "non-admin users" do
    it "are not able to access show action" do
      get :show

      expect(response).to redirect_to('/')
      expect(flash[:alert]).to eq "Alleen admins krijgen hier toegang."
    end
  end

end

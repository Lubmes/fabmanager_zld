require 'rails_helper'

RSpec.describe FabmomentsController, type: :controller do

  it 'handles a missing fabmoment correctly' do
    get :show, params: { id: 'not-here' }

    expect(response).to redirect_to(fabmoments_path)

    message = 'Het fabmoment waar je naar zocht is niet hier.'
    expect(flash[:alert]).to eq message
  end

  it 'handles permission errors by redirecting to a save place' do
    author = FactoryGirl.create(:user)
    allow(controller).to receive(:current_user)

    license = FactoryGirl.create(:license)
    fabmoment = FactoryGirl.create(:fabmoment, author: author, license: license)
    get :edit, params: { id: fabmoment }

    expect(response).to redirect_to(root_path)
    message = 'Je hebt geen toestemming om dat te doen.'
    expect(flash[:alert]).to eq message
  end

end

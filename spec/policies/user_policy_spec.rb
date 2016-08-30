require 'rails_helper'

# Zet deze spec later in (wanneer er een UsersController is + Pundit).
# Moet nog aangepast worden.

RSpec.xdescribe UserPolicy do
  context "permissions" do
    subject { UserPolicy.new(user) }
  
    context 'for anonymous users' do
      let(:user) { nil }

      it { should_not permit_action :update }
      it { should_not permit_action :archive }

    end

    context "for random users" do
      let(:random_user) { FactoryGirl.create :user }

      it { should_not permit_action :update }
      it { should_not permit_action :archive }
    end

    context "for users on themselves" do
      let(:random_user) { FactoryGirl.create user }

      it { should permit_action :update }
      it { should_not permit_action :archive }
    end

    context 'for admins' do
      let(:user) { FactoryGirl.create :user, :admin }

      it { should permit_action :update }
      it { should permit_action :archive }
    end
  end
end

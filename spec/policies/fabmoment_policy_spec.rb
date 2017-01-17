require 'rails_helper'

RSpec.describe FabmomentPolicy do
  context "permissions" do
    subject { FabmomentPolicy.new(user, fabmoment) }
    let(:license) { FactoryGirl.create(:license) }
  
    let(:user) { FactoryGirl.create :user }
    let(:author) { FactoryGirl.create :user }
    let(:fabmoment) { FactoryGirl.create :fabmoment, author: author, license: license }


    context 'for anonymous users' do
      let(:user) { nil }

      it { should_not permit_action :update }
      it { should_not permit_action :tag }

    end

    context "for random users" do
      let(:random_user) { FactoryGirl.create :user }

      it { should_not permit_action :update }
      it { should_not permit_action :tag }
    end

    context 'for authors of the fabmoment' do
      let(:user) { author }

      it { should permit_action :update }
      it { should permit_action :tag }
    end

    context 'for admins of the fabmoment' do
      let(:user) { FactoryGirl.create :user, :admin }

      it { should permit_action :update }
      it { should permit_action :tag }
    end
  end
end

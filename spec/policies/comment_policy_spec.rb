require 'rails_helper'

RSpec.describe CommentPolicy do
  context "permissions" do
    subject { CommentPolicy.new(user, comment) }
  
    let(:license) { FactoryGirl.create(:license) }
    let(:user) { FactoryGirl.create :user }
    let(:author) { FactoryGirl.create :user }
    let(:fabmoment) { FactoryGirl.create :fabmoment, author: author, license: license }
    let(:comment) { FactoryGirl.create :comment, fabmoment: fabmoment, author: author }


    context 'for anonymous users' do
      let(:user) { nil }

      it { should_not permit_action :create }
    end

    context "for random users" do
      let(:random_user) { FactoryGirl.create :user }

      it { should permit_action :create }
    end

    context 'for authors of the fabmoment' do
      let(:user) { author }

      it { should permit_action :create }
    end

    context 'for admins of the fabmoment' do
      let(:user) { FactoryGirl.create :user, :admin }

      it { should permit_action :create }
    end
  end
end

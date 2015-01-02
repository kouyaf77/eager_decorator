require "spec_helper"

describe UserDecorator do
  let(:user_name){"user_name"}
  before do
    User.create(:name => user_name)
  end

  context "When there is #reverse_name in user model" do
    subject {User.first.reverse_name}
    it {is_expected.to eq user_name.reverse}
  end
end

require 'rails_helper'

RSpec.describe Genre, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "validations" do
    it "validates presence of required" do
      should validate_presence_of(:name)
    end
  end
end

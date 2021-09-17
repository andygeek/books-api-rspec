require 'rails_helper'

RSpec.describe Genre, type: :model do

  describe "validations" do
    it "validates presence of required" do
      should validate_presence_of(:name)
    end
  end
end

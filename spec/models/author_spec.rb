require 'rails_helper'

RSpec.describe Author, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "validations" do
    it "validate presence of required" do
      should validate_presence_of(:name)
      should validate_presence_of(:last_name)
      should validate_presence_of(:age)
    end  
  end
  
end

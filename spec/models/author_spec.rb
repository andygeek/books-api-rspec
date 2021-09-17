require 'rails_helper'

RSpec.describe Author, type: :model do

  describe "validations" do
    it "validate presence of required" do
      should validate_presence_of(:name)
      should validate_presence_of(:last_name)
      should validate_presence_of(:age)
    end  
  end

end

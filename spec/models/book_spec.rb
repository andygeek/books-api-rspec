require 'rails_helper'

RSpec.describe Book, type: :model do

  describe "validations" do
    it "validate presence of required" do
      should validate_presence_of(:title)
      should validate_presence_of(:year)
      should validate_presence_of(:author_id)
      should validate_presence_of(:genre_id)
    end
  end

end

require 'rails_helper'

RSpec.describe Hospital, type: :model do
  it { should validate_presence_of(:name) }
end

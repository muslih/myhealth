require 'rails_helper'

RSpec.describe User, type: :model do
  #presence
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:name) }

  #uniquness
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }
end

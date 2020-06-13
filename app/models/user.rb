# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username, :email, :password_digest, :name
  validates_uniqueness_of :username, :email
end

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "Encrypt is getting called three times" do
    password = "test_password"
    ActiveRecord::Encryption::Cipher::Aes256Gcm.any_instance.expects(:encrypt).at_least(3).returns(encrypt(password))
    User.create!(username: "test_username", password: "test_password")
  end

  def encrypt(password)
    secret = "\xCA\x1A\x93G6#\xC9\x01\x19\x1A\x05\xC0\xE2B\xE2/Q\xB2\x1E&\xA5\xFE\x8F\xFDcs\xF2\x7F&\x05p\xCD"
    ActiveRecord::Encryption::Cipher::Aes256Gcm.new(secret, deterministic: false).encrypt(password)
  end
end

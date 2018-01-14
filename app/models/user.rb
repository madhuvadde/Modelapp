class User < ApplicationRecord
  before_create :confirmation_token
  has_secure_password
  validates :name,:password, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true, length: { maximum: 255 },
                    format:     { with: VALID_EMAIL_REGEX },
                     uniqueness: { case_sensitive: false }


   def confirmation_token
   	if self.confirm_token.blank?
   		self.confirm_token = SecureRandom.urlsafe_base64.to_s

   	end
   end

   def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end
end

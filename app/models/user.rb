class User < ApplicationRecord

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    before_save { self.email = email.downcase }
    
    validates(:name, presence: true)
    validates(:email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false })
    validates(:password, presence: true, length: { minimum: 8 })

    # adds password fields
    has_secure_password

    has_one :profile, dependent: :destroy
end

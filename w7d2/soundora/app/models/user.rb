# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :email, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validate :password, length: { minimum: 6, allow_nil: true }

    after_initialize :ensure_session_token

    private
        attr_reader :password
    public

    #SPIRE or RIPES

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        if user && user.password?(password)
            user
        else
            nil
        end
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)

        @password = password
    end

    def is_password?(password)
        Bcrypt::Password.new(self.password_digest).is_password?(password) #not recursion
    end

    def reset_session_token!
        self.session_token =SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

end

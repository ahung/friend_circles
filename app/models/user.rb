class User < ActiveRecord::Base
  attr_accessible :email, :password, :pw_reset_token
  attr_reader :password
  before_validation :generate_session_token, :on => :create
  validates :email, :session_token, :presence => true
  validates :email, :session_token, :uniqueness => true
  validates :password, :length => {:minimum  => 6, :allow_nil => true}

  has_many :friend_circle_memberships, :inverse_of => :user
  has_many :friend_circles, :inverse_of => :user
  has_many :friends, :through => :friend_circles, :source => :user
  has_many :posts
  

  def self.find_by_credentials(email, pw)
    @user = User.find_by_email(email)
    if @user && @user.is_password?(pw)
      @user
    end
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def generate_session_token
    self.session_token = SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    generate_session_token
    self.save!
  end

  def reset_pw_token!
    self.pw_reset_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.pw_reset_token
  end

end

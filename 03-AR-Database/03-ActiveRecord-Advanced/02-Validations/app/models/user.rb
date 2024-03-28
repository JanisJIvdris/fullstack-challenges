class User < ActiveRecord::Base
  has_many :posts
  before_validation :strip_mail
  after_save :welcome_email
  # TODO: Add some validation
  # TODO: Add some callbacks
  validates :username, presence: true
  validates :email, presence: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  validates :username, uniqueness: { case_sensitive: false }

  def strip_mail
    self.email = email.strip unless email.nil?
  end

  def welcome_email
    FakeMailer.instance.mail(email, "Welcome bob!")
  end
end

class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :timeoutable, :authentication_keys => [:username]
          #:confirmable

  # for generating random tokens (i.e. numbers)
  include Tokenable

  # for sending verification emails
  include VerifyEmail

  # appointments relationship
  has_many :appointments
  has_many :escorts, through: :appointments

  validates :username, presence: true
  validates :username, uniqueness: true, if: -> { self.username.present? }
  validates :name, presence: true
  validates :dob, presence: true
  validates :line1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :state, format: {with: /(^[A-Z]{2}$)/}, if: -> { self.state.present? }
  validates :zip, presence: true
  validates :zip, format: { with: /(^\d{5}$)|(^\d{5}-\d{4}$)/}, if: -> { self.zip.present? }

  validates :terms_of_service, acceptance: true # terms of service must be accepted

  def email_required?
    false
  end

  def email_changed?
    false
  end

  # only allow login if account is verified (by us)
  def active_for_authentication?
    super && self.verified
  end

  private

end

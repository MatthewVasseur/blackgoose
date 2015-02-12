class Escort < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :timeoutable, :authentication_keys => [:loginKey]

  # for generating random tokens (i.e. numbers)
  include Tokenable

  # for sending verification emails
  include VerifyEmail

  # appointments relationship
  has_many :appointments
  has_many :clients, through: :appointments
  has_many :onlineBlocks

  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false}, if: -> { self.username.present? }
  validates :name, presence: true
  validates :dob, presence: true
  validates :line1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :state, format: {with: /(^[A-Z]{2}$)/}, if: -> { self.state.present? }
  validates :zip, presence: true
  validates :zip, format: { with: /(^\d{5}$)|(^\d{5}-\d{4}$)/}, if: -> { self.zip.present? }

  validates :height, presence: true
  validates :weight, presence: true
  validates :ethnicity, presence: true
  validates :tit_size, presence: { message: "Breast size can't be blank"}
  validates :tit_type, presence: { message: "Breast type can't be blank"}
  validates :eyec, presence: { message: "Eye color can't be blank" }
  validates :hairc, presence: {message: "Hair color can't be blank"}

  validates :terms_of_service, acceptance: true

  attr_accessor :loginKey # for using either email or username

  # find the escort with either the given username or the given password
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if loginKey = conditions.delete(:loginKey)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => loginKey.downcase }]).first
    else
      where(conditions).first
    end
  end

  # only allow login if account is verified (by us)
  def active_for_authentication?
    super && self.verified
  end
end

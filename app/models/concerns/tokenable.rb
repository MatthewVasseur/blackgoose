# app/models/concerns/tokenable.rb
module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :generate_token
  end

  protected

  def included_classes
    ActiveRecord::Base.descendants.select {|c|
      c.included_modules.include?(Tokenable) }.map(&:name)
  end

  def generate_token
    self.token = loop do
      random_token = SecureRandom.random_number.to_s[2..7]
      break random_token unless included_classes.map {|c|
        c.constantize.exists?(token: random_token) }.include?(true)
    end
  end
end

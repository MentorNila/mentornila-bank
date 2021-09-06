class Client < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true

  has_many :accounts

  before_save :format_name

  def format_name
    self.first_name = self.first_name.upcase
    self.last_name = self.last_name.upcase
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

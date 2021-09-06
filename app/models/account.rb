class Account < ApplicationRecord
  belongs_to :client
  has_many :account_transactions
  validates :client, presence: true
  validates :currency, presence: true
  validates :status, presence: true
  validates :account_number, presence: true, uniqueness: true
  validates :balance, presence: true, numericality: true

  before_validation :load_defaults

  def load_defaults
    if !self.balance
      self.balance = 0.00
    end
    self.account_number = SecureRandom.uuid
  end
end

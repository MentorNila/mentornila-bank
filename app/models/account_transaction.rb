class AccountTransaction < ApplicationRecord
  belongs_to :account
  belongs_to :transfer, optional: true

  TRANSACTION_TYPES = ["withdraw", "deposit"]

  validates :account, presence: true
  validates :amount, presence: true, numericality: true
  validates :transaction_type, presence: true, inclusion: { in: TRANSACTION_TYPES }
  validates :transaction_number, presence: true, uniqueness: true

  before_validation :load_defaults

  def load_defaults
    if self.new_record?
      self.transaction_number = SecureRandom.uuid
    end
  end

end

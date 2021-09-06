class TransferCreator
  def initialize(transferor_id, transferee_id, amount, execution_date)
    @transferor_id = transferor_id
    @transferee_id = transferee_id
    @amount = amount.to_f
    @execution_date = execution_date
  end

  def send_funds
    transfereeAccount = Account::find(@transferee_id)
    transferorAccount = Account::find(@transferor_id)

    if transferorAccount.balance >= @amount
      begin
        @transfer = Transfer::new(
            transferee_id: @transferee_id,
            transferor_id: @transferor_id,
            execution_date: @execution_date,
          )
        @transfer.save
        ActiveRecord::Base.transaction do
          AccountTransaction::create([{
              account_id: @transferee_id,
              amount: @amount,
              transaction_type: 'deposit',
              transfer_id: @transfer.id
            }])
          AccountTransaction::create([{
              account_id: @transferor_id,
              amount: @amount,
              transaction_type: 'withdraw',
              transfer_id: @transfer.id
            }])
          transfereeAccount.balance = transfereeAccount.balance + @amount
          transfereeAccount.save

          transferorAccount.balance = transferorAccount.balance - @amount
          transferorAccount.save
        end
        return true
      rescue
        Transfer.destroy(@transfer.id)
        return false
      end
    end
  end
end

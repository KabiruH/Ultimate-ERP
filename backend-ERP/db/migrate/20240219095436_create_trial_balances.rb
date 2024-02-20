class CreateTrialBalances < ActiveRecord::Migration[7.1]
  def change
    create_table :trial_balances do |t|
      t.datetime :date

      t.timestamps
    end
  end
end

# app/models/trial_balance.rb
class TrialBalance < ApplicationRecord
    validates :date, :name, :amount, presence: true
  end
  
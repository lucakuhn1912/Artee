class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.zero_days?
      record.errors[:end] << 'date cannot be the same as start date'
    end
  end


end

class Lease < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :user
  belongs_to :art
  validates_with MyValidator

  def zero_days?
    (self.end - self.start).to_i.zero?
  end
end

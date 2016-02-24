class Transaction < ActiveRecord::Base
  belongs_to :invoice

  # default_scope { where(result: 'success') }
end

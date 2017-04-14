class Quote < ActiveRecord::Base
  validates :quotation_text, presence: true

end

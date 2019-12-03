class ReportError < ApplicationRecord
  belongs_to :user
  validates :errormessage,  presence: true

end

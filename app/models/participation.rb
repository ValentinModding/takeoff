class Participation < ApplicationRecord
  belongs_to :session
  belongs_to :user
  belongs_to :contact
end

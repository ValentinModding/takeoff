class Participation < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  belongs_to :contact
  attr_accessor :completed
end

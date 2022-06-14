class Contact < ApplicationRecord
  belongs_to :user
  validates :tel, length: { is: 10 }
end

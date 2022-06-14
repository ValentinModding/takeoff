class Contact < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :tel, length: { is: 10 }
end

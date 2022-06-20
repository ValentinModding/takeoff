class Activity < ApplicationRecord
  belongs_to :spot
  has_many :participations, dependent: :destroy

  def participations_count
    @participations = self.participations.count
  end
end

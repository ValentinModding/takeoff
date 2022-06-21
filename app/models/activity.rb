class Activity < ApplicationRecord
  belongs_to :spot
  has_many :participations, dependent: :destroy

  def participations_count
    @participations = self.participations.count
  end

  include PgSearch::Model
  pg_search_scope :search,
    against: [ :name],
    associated_against: {
      spot: [ :name, :address ]
    },
    using: {
      tsearch: { prefix: true }
    }
end

class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, uniqueness: true, presence: true
  before_destroy :check_for_doses

  private

  def check_for_doses
    false if doses.count.positive?
  end
end

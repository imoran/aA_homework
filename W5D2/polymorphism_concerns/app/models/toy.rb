class Toy < ApplicationRecord
  validates :name, uniqueness: { scope: [:toyable] }
  validates :toyable_id, uniqueness: true
  validates :toyable_type, uniqueness: true
  
  belongs_to :toyable, polymorphic: true
end

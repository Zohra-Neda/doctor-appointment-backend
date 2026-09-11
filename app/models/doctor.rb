class Doctor < ApplicationRecord
  belongs_to :category
  has_many :appointments

  has_one_attached :image
end

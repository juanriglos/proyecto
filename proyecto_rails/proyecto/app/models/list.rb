class List < ApplicationRecord
validates :URL, uniqueness:true
validates :URL, presence:true


  has_many :tareas

  extend FriendlyId
  friendly_id :URL, use: :slugged
end

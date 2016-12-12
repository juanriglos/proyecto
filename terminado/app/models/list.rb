class List < ApplicationRecord
validates :URL, uniqueness:true
validates :URL, presence:true


  has_many :tareas, dependent: :destroy

  extend FriendlyId
  friendly_id :URL, use: :slugged

  def should_generate_new_friendly_id?
    new_record?
  end
end

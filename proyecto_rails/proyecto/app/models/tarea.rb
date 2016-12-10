class Tarea < ApplicationRecord
  belongs_to :list
validates :type, presence:true
end

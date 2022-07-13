class Task < ApplicationRecord
    belongs_to :category

    validates :name, presence: true, length: { in: 6..20 }
end

class Category < ApplicationRecord
    has_many :tasks, dependent: :destroy

    validates :name, presence: true, length: { in: 6..20 }
end

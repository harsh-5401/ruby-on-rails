class Article <ApplicationRecord
  # to prevent nil entries 
  # learn at active record validation website 
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 5, maximum: 200 }
end


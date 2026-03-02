class Article < ApplicationRecord
  has_many :comments, dependent: :destroy # Si on supprime l'article, on supprime ses commentaires
  
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
end
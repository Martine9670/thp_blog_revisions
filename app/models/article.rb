class Article < ApplicationRecord
  # On veut que le titre soit présent et fasse au moins 5 caractères
  validates :title, presence: true, length: { minimum: 5 }
  
  # On veut que le corps (body) soit présent
  validates :body, presence: true
end
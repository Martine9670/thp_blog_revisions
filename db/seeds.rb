# On s'assure que la base est propre
Article.destroy_all
User.destroy_all

puts "Création de l'utilisateur principal..."
user = User.create!(
  email: 'martine@exemple.com',
  password: 'password',
  password_confirmation: 'password'
)

puts "Génération de 30 articles..."
30.times do |i|
  Article.create!(
    title: "Article THP n°#{i + 1}",
    body: "Ceci est le contenu de l'article numéro #{i + 1}. Il a été généré automatiquement pour valider la ressource Importmap et Devise.",
    user: user
  )
end

puts "Succès ! 1 utilisateur et 30 articles créés."
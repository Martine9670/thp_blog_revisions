puts "Cleaning old articles..."
Article.destroy_all

puts "Creating 30 new articles..."
30.times do |i|
  Article.create!(
    title: "Article n°#{i + 1}",
    body: "Voici le contenu de l'article numéro #{i + 1}. Il utilise bien la colonne 'body' cette fois !"
  )
end

puts "Done!"
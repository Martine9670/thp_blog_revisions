import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"

document.addEventListener("turbo:load", () => {
  console.log("Le script est bien chargé sur la page !");
  const btn = document.getElementById("count-btn");
  
  if (btn) {
    btn.addEventListener("click", () => {
      const total = document.querySelectorAll('.article-item').length;
      alert("Test direct : " + total + " articles !");
    });
  } else {
    console.log("Bouton non trouvé...");
  }
});
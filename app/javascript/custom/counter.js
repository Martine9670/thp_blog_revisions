export function countArticles() {
  const articles = document.querySelectorAll('.article-item').length;
  alert("Il y a " + articles + " articles sur cette page !");
}
class CommentsController < ApplicationController
  # 1. On utilise Devise pour l'auth, plus le mot de passe "martine"
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    
    # 2. On lie le commentaire à l'article ET à l'utilisateur connecté
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user 

    if @comment.save
      redirect_to article_path(@article), notice: "Commentaire publié !"
    else
      redirect_to article_path(@article), alert: "Erreur : le commentaire est vide."
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    # 3. SÉCURITÉ CRUCIALE (Bonus 2.8.3) : Seul l'auteur peut supprimer
    if @comment.user == current_user
      @comment.destroy
      redirect_to article_path(@article), notice: "Commentaire supprimé.", status: :see_other
    else
      redirect_to article_path(@article), alert: "Action interdite : ce n'est pas ton commentaire !"
    end
  end

  private
    def comment_params
      # 4. On ne permet plus :commenter (il n'existe plus en DB)
      params.require(:comment).permit(:body)
    end
end
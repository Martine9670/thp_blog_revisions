class ArticlesController < ApplicationController
  # 1. Remplace l'auth basique par celle de Devise
  before_action :authenticate_user!, except: [:index, :show]
  
  before_action :set_article, only: %i[ show edit update destroy ]
  
  # 2. Sécurité : Vérifie que l'utilisateur est bien le propriétaire (Point 2.6.2)
  before_action :authorize_user!, only: %i[ edit update destroy ]

  # GET /articles or /articles.json
  def index
    if params[:query].present?
      @articles = Article.where("title LIKE ?", "%#{params[:query]}%")
    else
      @articles = Article.all
    end
    # Le scaffold gère déjà le format.json ici par défaut
  end
  
  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    # On pré-lie l'article au user actuel
    @article = current_user.articles.build
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    # 3. L'article est créé à partir de l'utilisateur connecté
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy!

    respond_to do |format|
      format.html { redirect_to articles_path, notice: "Article was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Vérifie que l'utilisateur connecté est bien l'auteur de l'article
    def authorize_user!
      if @article.user != current_user
        redirect_to articles_path, alert: "Accès refusé : tu n'es pas l'auteur de cet article."
      end
    end

    def set_article
      # Utilise find(params[:id]) si params.expect cause des soucis selon ta version de Rails
      @article = Article.find(params[:id])
    end

    def article_params
      # Assure-toi que les noms correspondent à ta base (title et body)
      params.require(:article).permit(:title, :body)
    end
end
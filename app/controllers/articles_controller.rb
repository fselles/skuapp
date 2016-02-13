class ArticlesController < ApplicationController
  before_action :require_signin
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    # @articles = Article.order('name ASC').all
    # @articles = Article.all
    if params[:search]
      @articles = Article.search(params[:search]).order("name ASC")
    else
      @articles = Article.all.order("name ASC")
    end
    respond_to do |format|
      format.html
      format.xml
      format.csv { send_data @articles.to_csv }
    end
  end


  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Artikel is succesvol aangemaakt.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { flash.now[:alert] = "Er zijn fouten bij het aanmaken van het artikel!" 
        render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Artikel is succesvol aangepast.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { flash.now[:alert] = "Er zijn fouten bij het updaten van het artikel!"
        render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Artikel is succesvol verwijderd.' }
      format.json { head :no_content }
    end
  end

  def import
    if !params[:file].blank?
      begin
      Article.import(params[:file])
      redirect_to root_url, notice: "Artikelen zijn geimporteerd!."
      rescue
        redirect_to root_url, alert: "Foutief CSV bestandsformaat, of ontbrekende velden in CSV bestand."
      end
    else
    redirect_to articles_url, alert: 'Geen bestand geselecteerd voor upload.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:name, :duplex, :media, :papiertype, :inslag_staand, :inslag_liggend, :kleur, :aantal_drukvel)
    end
end

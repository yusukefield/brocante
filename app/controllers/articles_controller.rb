class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    #タグ絞り込み tagged_withメソッド
    if params[:tag_name].present?
      @articles = Article.tagged_with([params[:tag_name]])
    else
      @articles = Article.all
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find_by(id: params[:id])
    @user = @article.user
    @latitude = @article.latitude
    @longitude = @article.longitude
    @address = @article.address
    @comment = Comment.new
    @comments = @article.comments
  end

  # GET /articles/new
  def new
    @article = Article.new
    @article.article_pictures.build
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find_by(id: params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.tag_list = article_params[:tag_list]
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:date, :title, :body, :country, :category, :address, :latitude, :longitude, :tag_list, :main_picture, article_pictures_pictures: [])
    end
end

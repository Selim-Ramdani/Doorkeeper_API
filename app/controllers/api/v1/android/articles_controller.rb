class Api::V1::Android::ArticlesController < ApiController
  include ApplicationHelper
  before_action :set_article, only: %i[show]
  skip_before_action :doorkeeper_authorize!
  before_action :is_admin?
  # GET /articles or /articles.json
  def index
    @articles = Article.all
    render json: @articles
  end

  # GET /articles/1 or /articles/1.json
  def show
    render json: @article
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article)
    end
end

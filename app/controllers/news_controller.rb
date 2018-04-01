class NewsController < ApplicationController
  before_action :set_news, only: [:show, :update, :destroy]

  # GET /news
  # GET /news.json
  def index
    @news = New.all
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # POST /news
  # POST /news.json
  def create
    @news = New.new(news_params)

    if @news.save
      render :show, status: :created, location: @news
    else
      render json: @news.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    if @news.update(news_params)
      render :show, status: :ok, location: @news
    else
      render json: @news.errors, status: :unprocessable_entity
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = New.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title, :string, :subtitle, :body)
    end
end

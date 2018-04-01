class NewsController < ApplicationController
  before_action :set_news, only: [:show, :update, :destroy]

  # GET /news
  # GET /news.json
  def index
    @news = New.order('created_at DESC')
    render json: @news, status: :ok
  end

  # GET /news/1
  # GET /news/1.json
  def show
    render json: @news, status: :ok
  end

  # POST /news
  # POST /news.json
  def create
    @news = New.new(news_params)

    if @news.save
      render json: @news, status: :created
    else
      render json: @news.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    if @news.update(news_params)
      head :no_content
    else
      render json: @news.errors, status: :unprocessable_entity
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    head :no_content
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

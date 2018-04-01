class NewsController < ApplicationController
  before_action :set_news, only: [:show, :update, :destroy]

  # GET /news
  # GET /news.json
  def index
    @news = New.order('created_at DESC')
    render json: @news.as_json(except: [:body], methods: [:short_body]), status: :ok
  end

  # GET /news/1
  # GET /news/1.json
  def show
    if @news.nil?
      render json: {erro: "Not Found"}, status: :not_found
    else
      render json: @news, status: :ok
    end
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
    if @news.update_attributes(news_params)
      render json: @news, status: :ok
    else
      render json: {message: "Not found"}, status: :not_found
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    if @news.nil?
      render json: {error: "Not found"}, status: :not_found
    else
      render json: @news, status: :ok
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = New.where(:id => params[:id]).first
    end

  
    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title, :string, :subtitle, :body)
    end
end

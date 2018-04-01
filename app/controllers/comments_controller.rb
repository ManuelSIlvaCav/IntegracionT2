class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :find_noticium only: [:create, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.order("created_at DESC")
    render json: @comments, status: :ok
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    if @comment.nil?
      render json: {error: "Not Found"}, status: :not_found
    else
      render json: @comment, status: :ok
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @noticia.comments.create(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if @comment.update_attributes(comment_params)
      render json: @comment, status: :ok
    else
      render json: {error: "Not found"}, status: :not_found
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    if @comment.nil?
      render json: {error: "Not found"}, status: :not_found
    else
      render json: @comment, status: :ok
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.where(:id => params[:id]).first
    end

    def find_noticium
      @noticia = New.find(params[:new_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:author, :comment, :new_id)
    end
end

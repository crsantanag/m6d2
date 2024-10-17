class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_request, only: [ :destroy ]
  before_action :set_post, only: [ :create, :edit, :destroy ]
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.order(created_at: :desc)
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post), notice: "Comentario exitosamente creado" }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render "posts/show", status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    respond_to do |format|
      if  @comment.destroy
        format.html { redirect_to post_path(@post), notice: "Comentario eliminado" }
        format.json { head :no_content }
      else
        format.html { redirect_to post_path(@post), notice: "Hubo un problema al eliminar el comentario." }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # def set_comment
    #   @comment = Comment.find(params[:id])
    # end

    def set_post
      @post = Post.find(params[:post_id]) # Aquí obtengo el post según el ID pasado en la ruta
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end

    def authorize_request
      unless current_user.admin? || current_user == @comment.user
        flash[:alert] = "No tienes permiso para eliminar este comentario."
        redirect_to @post
      end
    end
end

class PostsController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_post, only: %i[ show edit update destroy ]

  # before_action :store_page_url, only: [ :show ]

  before_action only: [ :new, :create ] do
    authorize_request([ "author", "admin" ])
  end

  before_action only: [ :edit, :update, :destroy ] do
    authorize_request([ "admin" ])
  end

  # GET /posts or /posts.json
  def index
    @pagy, @posts = pagy(Post.order(created_at: :desc))
    # @pagy, @posts = pagy(Post
    #        .left_joins(:comments)             # Incluye los posts sin comentarios
    #        .group("posts.id")                 # Agrupa por el ID del post
    #        .order("COUNT(comments.id) DESC")) # Ordena por el número de comentarios
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id # o @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post fue creado exitosamente" }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post fue actualizado exitosamente" }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    if @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: "Post eliminado" }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to post_url, notice: "No se puede eliminar el post porque tiene comentarios asociados" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def store_page_url
      if request.referer && request.referer.include?("page=")
        session[:previous_page_url] = request.referer
      end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:image, :title, :description)
    end
end

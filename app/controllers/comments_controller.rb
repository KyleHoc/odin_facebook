class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @post = Post.find(@comment.post_id)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    @post = Post.find(@comment.post_id)
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_path(@post.id), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@post.id), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
  def comment_params
    if params[:comment]
      params.require(:comment).permit(:body, :post_id, :author_id)
    end
  end
end

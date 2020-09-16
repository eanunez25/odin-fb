class PostsController < ApplicationController

  def index
    @our_posts = current_user.friends_and_own_posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create 
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created'
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])


    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_back(fallback_location: root_path)
  end

  private

    def post_params 
      params.require(:post).permit(:content)
    end

end

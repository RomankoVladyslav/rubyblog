class PostsController < ApplicationController
  def index
   @post = Post.all
  end

def new
@post = Post.new
end

def show
  @post = Post.find(params[:id])
end

def edit
  @post = Post.find(params[:id])
end

def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
end

def update
@post = Post.find(params[:id])

   if(@post.update(post_params))
      redirect_to @post
   else
      render 'new'
   end
end

def destroy
  @post = Post.find(params[:id])

  @post.destroy
  redirect_to posts_path
end

def create
    @post = Post.new(post_params)
    @post.user = current_user


    if (@post.save)
      redirect_to @post
    else
      render 'new'
    end
end

private def post_params
  params.require(:post).permit(:title, :body)
end
end

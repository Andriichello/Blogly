class PostsController < ApplicationController

    def index
        search = params[:search]
        if search
            @posts = Array.new
            Post.all.each do |post|
                if (post.title.include? search) || (post.body.include? search) 
                    @posts.push(post)                
                elsif User.find_by(id:post.creator) && (User.find_by(id:post.creator).name.include? search)
                    @posts.push(post)                
                end
            end

        else
            @posts = Post.all.reverse
        end

        @user = User.find_by(id:session[:user_id])
    end
    
    def show 
        @post = Post.find(params[:id])
    end

    def new 
        @post = Post.new
    end

    def create
        # render plain: params[:post].inspect
        @post = Post.new(post_params)

        if (@post.save)
            redirect_to @post
        else
            render 'new'
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if (@post.update(post_params))
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to posts_path
    end

    private def post_params
        params.require(:post).permit(:title, :body, :creator)
    end
    
end

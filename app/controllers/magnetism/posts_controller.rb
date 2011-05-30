module Magnetism
  class PostsController < ApplicationController
    before_filter :authenticate_admin!, except: [:index, :show]
    # respond_to :html

    def index
      redirect_to new_blog_path if Blog.first.blank?
      @posts = Blog.first.posts.all unless Blog.first.blank?
    end

    def show
      @post = Blog.first.posts.where(permalink: params[:id]).first
    end

    def new
      @post = Blog.first.posts.new
    end

    def edit
      @post = Blog.first.posts.where(permalink: params[:id]).first
    end

    def create
      @post = Blog.first.posts.create!(params[:post])

      if @post.save
        redirect_to(posts_path, notice: 'Post was successfully created.')
      end
    end

    def update
      @post = Blog.first.posts.where(permalink: params[:id]).first

      if @post.update_attributes(params[:post])
        redirect_to(@post, notice: 'Post was successfully updated.')
      end
    end

    def destroy
      @post = Blog.first.posts.delete(Blog.first.posts.where(permalink: params[:id]))
      redirect_to posts_path    
    end
  end
end
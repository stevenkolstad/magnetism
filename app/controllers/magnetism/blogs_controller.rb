module Magnetism
  class BlogsController < ApplicationController
    before_filter :authenticate_admin!, :except => [:index, :show]

    def show
      redirect_to new_blog_path unless Blog.first
      @blog = Blog.first
    end

    def new
      redirect_to edit_blog_url if Blog.first
      @blog = Blog.new
    end

    def edit
      redirect_to new_blog_path unless Blog.first
      @blog = Blog.first
    end

    def create
      @blog = Blog.new(params[:blog])
      if @blog.save
        redirect_to(new_post_path, notice: "#{@blog.name} was successfully setup.")
      end
    end

    def update
      @blog = Blog.find(params[:id])

      respond_to do |format|
        if @blog.update_attributes(params[:blog])
          format.html { redirect_to(@blog, :notice => 'Blog was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
        end
      end
    end

    def destroy
      @blog = Blog.find(params[:id])
      @blog.delete
    end
  end
end
class BlogsController < ApplicationController
	before_action :auth_user, except: [:index, :show]

	def index 
		@blogs = Blog.page(params[:page] || 1).per_page(params[:per_page] || 10).order("id desc")
	end

	def show 
		@blog = Blog.find(params[:id])
	end

	def new 
		@blog = Blog.new
	end

	def create 
		@blog = current_user.blogs.new(blog_attrs)
		@blog.user = current_user #这里的current_user是个方法，定义在concerns的user_sessions中
		if @blog.save 
			flash[:notice] = "博客创建成功"
			redirect_to blogs_path
		else
			flash[:notive] = "博客创建失败"
			render action: :new
		end
	end

	#params参数校验
	def blog_attrs
		params.require(:blog).permit(:title, :content)
	end
end

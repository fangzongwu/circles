# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
 
lib/tasks 防止所有的自动化配置；

* ...

##### 项目流程如下：
- rails new Circles
- 更改gemfile源为https://www.ruby.taobao.org
- bundle
- 创建第一个controller：`rails generate controller Welcome index` ——创建一个welcome控制器，并且指定一个action为index;
- 修改路由：指定首页路由  在`config/routes.rb`中写上这句root `welcome#index`;
- 手动创建一个controller
	- 在controllers目录下边新建一个controller为：users_controller.rb(名字_controller.rb);
	- 在users_controller.rb下边定义一个new action
	```
	class UsersController < ApplicationController 
		def new 

		end
	end
	```
	- 在view下边新建一个目录名为controller的名字users，在users下边新建一个文件：new.html.erb `views/users/new.html.erb`;
	- 定义路由，在`config/routes.rb`中添加路由，这里使用resource路由：
	```
	...

	resource :users
	...

	```
- 引入gem包，这里引入bootstrap的gem包;
	- 在gemfile中添加`gem 'bootstrap-sass', '~> 3.3.5.1'#引入bootstrap`
	- bundle
	- `app/assets/stylesheets/`中更改application.css为application.scss,因为我们用的是scss，所以这里我们要修改application，他是一个入口文件;
	```
	@import "bootstrap-sprockets";
	@import "bootstrap";

	```
	- 在`views/layouts/application.html.erb`中修改一下链接：删除这部分：
	```
	'data-turbolinks-track': 'reload'

	```
	其实，在rails在views/layouts、stytlesheets、javascripts下边都有一个application文件，这是rails自带的，页面加载时会先加载这些文件；
	- 重新启动服务（bundle之后一定要重启服务）
class User < ApplicationRecord
	validates :username, presence: { message: "用户名不能为空" }
	validates :username, uniqueness: { message: "用户名已经存在" }
	validates :password, presence: { message: "密码不能为空" }
	validates :password, length: {minimum: 6, message: "密码最短为6位数字" }

	has_many :blogs

	#自定义一个关联关系，用来查找公开的blog；
	has_many :public_blogs, -> { where(is_public: true) },
		class_name: "Blog"

end

class Blog < ApplicationRecord
	validates :title, presence: { message: "标题不能为空" }
	validates :content, uniqueness: { message: "内容不能为空" }
	validates :user_id, presence: { message: "作者不能为空" }

	belongs_to :user
	# has_and_belongs_to_many :tags
	has_many :blogs_tags, class_name: "BlogsTags"
	has_many :tags, through: :blogs_tags

end

class Tag < ApplicationRecord
	validates :title, uniqueness: { message: "标签不能重复" }
	# has_and_belongs_to_many :blogs
	has_many :blogs_tags, class_name: "BlogsTags"
	has_many :blogs, through: :blogs_tags

end

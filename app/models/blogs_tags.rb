class BlogsTags < ApplicationRecord 

	self.table_name = "blogs_tags"

	# 模型校验
	validates_uniqueness_of :blog_id, scope: [:tag_id]

	belongs_to :blog
	belongs_to :tag

end
class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
    	t.string :title
      t.timestamps
    end

    #创建第三张关联关系表
    create_table :blogs_tags do |t| 
    	t.integer :blog_id
    	t.integer :tag_id
    end
  end
end

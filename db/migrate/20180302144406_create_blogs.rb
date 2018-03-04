class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
    	t.string :title
    	t.text :content
    	t.boolean :is_public, default: true
    	#创建与User数据表的关系（多对一）d等同于t.integer :user_id
    	t.belongs_to :user
      t.timestamps null: false
    end

    #创建索引，第一个参数是表名，第二个参数是要添加索引的字段
    add_index :blogs, [:user_id] 
  end
end

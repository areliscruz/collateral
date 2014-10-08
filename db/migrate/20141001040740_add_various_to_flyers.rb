class AddVariousToFlyers < ActiveRecord::Migration
  def change
    add_column :flyers, :title, :string
    add_column :flyers, :address, :string
    add_column :flyers, :description, :text
    add_column :flyers, :contact, :string
    add_column :flyers, :image, :string
  end
end

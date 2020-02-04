class AddImageAndDescriptionToInformation < ActiveRecord::Migration
  def change
    add_column :information, :login_image_uid, :string
    add_column :information, :description, :string
  end
end

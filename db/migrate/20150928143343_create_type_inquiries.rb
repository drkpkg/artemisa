class CreateTypeInquiries < ActiveRecord::Migration
  def change
    create_table :type_inquiries do |t|

      t.timestamps
    end
  end
end

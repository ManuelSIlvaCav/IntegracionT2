class DeleteStringNew < ActiveRecord::Migration[5.0]
  def change
    remove_column :news, :string
  end
end

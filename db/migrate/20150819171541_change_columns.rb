class ChangeColumns < ActiveRecord::Migration
  def change
    change_column :movies, :release_date, :integer
    change_column :movies, :in_theaters, :boolean
  end
end

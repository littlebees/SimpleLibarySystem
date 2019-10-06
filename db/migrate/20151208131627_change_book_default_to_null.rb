class ChangeBookDefaultToNull < ActiveRecord::Migration
  def change
  change_column_default :books, :copy_number, nil
  end
end

class ChangeAuthorOrganizationToNull < ActiveRecord::Migration
  def change
    change_column_null :authors, :organization, true
  end
end

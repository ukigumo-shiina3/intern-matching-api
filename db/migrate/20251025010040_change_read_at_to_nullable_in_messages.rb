class ChangeReadAtToNullableInMessages < ActiveRecord::Migration[8.0]
  def change
    change_column_null :messages, :read_at, true
  end
end

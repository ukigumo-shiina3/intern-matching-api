class ChangeColomnToNullableInMessages < ActiveRecord::Migration[8.0]
  def change
    change_column_null :messages, :intern_id, true
    change_column_null :messages, :company_id, true
  end
end

class AddUniqueIndexToCompaniesFirebaseUid < ActiveRecord::Migration[8.0]
  def change
    add_index :companies, :firebase_uid, unique: true
  end
end

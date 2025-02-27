class AddColumnToUsers < ActiveRecord::Migration[7.2]
  def change
    change_table :users do |t|
      # omniauth(LINE認証)に必要なカラム
      t.string :provider
      t.string :uid
      t.string :name
    end
  end
end

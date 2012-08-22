class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, :force => true do |t|
      t.string "login", :null => false
      t.string "nombre"
      t.string "email"
      t.string "crypted_password", :null => false
      t.string "password_salt", :null => false
      t.string "password_field"
      t.string "persistence_token", :null => false
      t.string "single_access_token", :null => false
      t.string "perishable_token", :null => false
      t.integer "login_count", :default => 0, :null => false
      t.integer "failed_login_count", :default => 0, :null => false
      t.timestamp "last_request_at"
      t.timestamp "current_login_at"
      t.timestamp "last_login_at"
      t.string "current_login_ip"
      t.string "last_login_ip"
      t.timestamp "created_at"
      t.timestamp "updated_at"
    end
  end
end

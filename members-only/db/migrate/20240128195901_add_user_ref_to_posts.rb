class AddUserRefToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :user, null: false, foreign_key: true

    # This was added with the command "rails g migration AddUserRefToPosts user:preferences"
  end
end

class ChangeUserIdToNotUnique < ActiveRecord::Migration[5.2]
  def change
    remove_index :shortened_urls, column: :author_id
    remove_index :shortened_urls, column: :long_url
    add_index :shortened_urls, :author_id
    add_index :shortened_urls, :long_url
  end
end

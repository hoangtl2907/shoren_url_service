class CreateShortUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :short_urls, id: false do |t|
      t.string :code, primary_key: true
      t.string :url, null: false

      t.timestamps
    end
  end
end

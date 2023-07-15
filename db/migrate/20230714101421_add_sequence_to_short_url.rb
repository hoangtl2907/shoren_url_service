class AddSequenceToShortUrl < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      CREATE SEQUENCE short_urls_code_seq
    SQL
  end

  def down
    execute <<-SQL
      DROP SEQUENCE short_urls_code_seq
    SQL
  end
end

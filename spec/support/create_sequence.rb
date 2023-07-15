RSpec.configure do |config|
  config.before(:all) do
    ActiveRecord::Base.connection.execute('CREATE SEQUENCE IF NOT EXISTS short_urls_code_seq')
  end
end

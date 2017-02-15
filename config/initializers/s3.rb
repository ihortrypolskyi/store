CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => "AKIAI445DIC7QZOYAT7Q",
      :aws_secret_access_key  => "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",
      :region                 => 'eu-central-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "booksssstore"
end
if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_secret_key_id: 'AKIAI445DIC7QZOYAT7Q',
      aws_secret_access_key: '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'
    }
    config.fog_directory = 'booksssstore'
  end
end
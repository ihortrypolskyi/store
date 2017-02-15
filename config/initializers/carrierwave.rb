# CarrierWave.configure do |config|
#   if Rails.env.production?
#     config.storage :aws
#     config.aws_credentials = {
#         provider: 'AWS',
#         aws_access_key_id: 'AKIAI445DIC7QZOYAT7Q',
#         aws_secret_access_key: '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',
#         region: 'EU (Frankfurt)'
#     }
#     config.aws_bucket = 'booksssstore'
#   else
#     config.storage :file
#   end
# end
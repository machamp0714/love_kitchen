if Rails.env.production?
  Carrierwave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV["CHIRORU_ACCESS_ID"],
      aws_secret_access_key: ENV["CHIRORU_SECRET_KEY"],
      region: ENV["CHIRORU_REGION"]
    }

    config.fog_directory = 'lovekitchen-bucket'
  end
end
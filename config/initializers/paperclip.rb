if Rails.env.development? || Rails.env.production?
  config.paperclip_defaults = {
    storage: :s3,
    s3_credentials: {
      bucket: "Rushbase_#{Rails.env}"
    }
  }
  AWS.config({
    access_key_id: ENV["access_key_id"],
    secret_access_key: ENV["secret_access_key"]
  })
end


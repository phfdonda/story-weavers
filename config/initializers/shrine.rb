require 'shrine'
if Rails.env.development?
  require 'shrine/storage/file_system'
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
    store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store')
  }
elsif Rails.env.test?
  require 'shrine/storage/memory'
  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
else
  require 'shrine/storage/s3'
  s3_options = {
    access_key_id: Rails.application.secrets.s3_access_key_id,
    secret_access_key: Rails.application.secrets.s3_secret_access_key,
    region: Rails.application.secrets.s3_region,
    bucket: Rails.application.secrets.s3_bucket
  }
  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
    store: Shrine::Storage::S3.new(prefix: 'store', **s3_options)
  }
end
Shrine.plugin :activerecord
Shrine.plugin :presign_endpoint
Shrine.plugin :backgrounding
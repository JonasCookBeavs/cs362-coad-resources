#!/usr/bin/env ruby
# Script to encrypt Rails credentials

require 'active_support/all'

cred_file = 'config/credentials.yml.enc'
key_file = 'config/master.key'

unless File.exist?(key_file)
  puts "Error: config/master.key not found!"
  exit 1
end

master_key = File.read(key_file).strip

# Create the credentials YAML content
credentials_content = <<~YAML
  secret_key_base: 313eb3649ce0435adccd5ebdbb65d6fa5bb5150a7e6d0e05342edb1899f86eb5fefd4a4fc4a666d3c3ac518f93ff39da522ebf24d72f071b1f34d15529b1bc35

  admins:
    admin: admin@example.com

  default_admin_password: password

  user:
    email: testuser@example.com
    password: password
YAML

# Encrypt using Rails encryption
encryptor = ActiveSupport::MessageEncryptor.new(
  [master_key].pack("H*"),
  serializer: ActiveSupport::MessageEncryptor::NullSerializer
)

encrypted = encryptor.encrypt_and_sign(credentials_content)

# Write to file
File.write(cred_file, encrypted)
puts "✓ Encrypted credentials written to #{cred_file}"

#!/bin/bash
# Script to set up Rails credentials

cd /home/user/cs362-coad-resources

# Read the master key
MASTER_KEY=$(cat config/master.key)

# Create a temporary unencrypted credentials file
cat > config/credentials.yml.tmp << 'EOF'
secret_key_base: 313eb3649ce0435adccd5ebdbb65d6fa5bb5150a7e6d0e05342edb1899f86eb5fefd4a4fc4a666d3c3ac518f93ff39da522ebf24d72f071b1f34d15529b1bc35

admins:
  admin: admin@example.com

default_admin_password: password

user:
  email: testuser@example.com
  password: password
EOF

# Encrypt it using Rails
bundle exec rails credentials:edit --enroll

# Clean up
rm -f config/credentials.yml.tmp

echo "Credentials file created successfully!"

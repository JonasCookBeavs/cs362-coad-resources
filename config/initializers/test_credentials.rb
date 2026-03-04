# Test credentials initializer
# This file sets up credentials for testing environment

if Rails.env.test?
  # Set up test credentials to avoid secrets deprecation warnings
  Rails.application.credentials.admins = {
    admin: 'admin@test.com'
  }
  Rails.application.credentials.default_admin_password = 'password123'
end
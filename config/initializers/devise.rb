# frozen_string_literal: true

Devise.setup do |config|
  # Use this hook to configure devise mailer, warden hooks and so forth.
  # Many of these configuration options can be set straight in your model.

  # ==> Mailer Configuration
  # Configure the e-mail address which will be shown in Devise::Mailer,
  # note that it will be overwritten if you use your own mailer class
  # with default "from" parameter.
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  # Configure the class responsible to send e-mails.
  # config.mailer = 'Devise::Mailer'

  # Configure the parent class responsible to send e-mails.
  # config.parent_mailer = 'ActionMailer::Base'

  # ==> ORM configuration
  # Load and configure the ORM. Supports :active_record (default) and
  # :mongoid (bson_ext recommended) by default. Other ORMs may be
  # available as additional gems.
  require 'devise/orm/active_record'

  # ==> JWT configuration
  # config/initializers/devise.rb
  config.jwt do |jwt|
    jwt.secret = Rails.application.credentials.dig(:devise, :jwt_secret_key) || 'your_secret_key'
    jwt.dispatch_requests = [
      ['POST', %r{^/api/v1/auth/sign_in$}]
    ]
    jwt.expiration_time = 24.hours.to_i
  end
  # ==> Configuration for any authentication mechanism
  # Configure which keys are used when authenticating a user. The default is
  # just :email. You can configure it to use [:username, :subdomain], so for
  # authenticating a user, both parameters are required.
  # config.authentication_keys = [:email]

  # Configure which authentication keys should be case-insensitive.
  config.case_insensitive_keys = [:email]

  # Configure which authentication keys should have whitespace stripped.
  config.strip_whitespace_keys = [:email]

  # By default, Devise will store the user in session. You can skip storage for
  # particular strategies by setting this option.
  config.skip_session_storage = [:http_auth]

  # The time the user will be remembered without asking for credentials again.
  # config.remember_for = 2.weeks

  # Defines which key will be used when recovering the password for an account
  config.reset_password_keys = [:email]

  # Time interval you can reset your password with a reset password key.
  config.reset_password_within = 6.hours

  # Number of authentication tries before locking an account if lock_strategy
  # is failed attempts.
  # config.maximum_attempts = 20

  # Time interval to unlock the account if :time is enabled as unlock_strategy.
  # config.unlock_in = 1.hour

  # The default HTTP method used to sign out a resource. Default is :delete.
  config.sign_out_via = :delete

  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'

  # ==> Scopes configuration
  # Configure the default scope given to Warden. By default it's the first
  # devise role declared in your routes (usually :user).
  # config.default_scope = :user

  # Set this configuration to false if you want /users/sign_out to sign out
  # only the current scope. By default, Devise signs out all scopes.
  # config.sign_out_all_scopes = true

  # ==> Hotwire/Turbo configuration
  # When using Devise with Hotwire/Turbo, the http status for error responses
  # and some redirects must match the following.
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other

  # ==> Configuration for :registerable

  # When set to false, does not sign a user in automatically after their password is
  # changed. Defaults to true, so a user is signed in automatically after changing a password.
  # config.sign_in_after_change_password = true
end
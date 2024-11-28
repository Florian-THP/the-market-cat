# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Add the `app/assets/images` folder explicitly if necessary.
Rails.application.config.assets.paths << Rails.root.join("app", "assets", "images")

# Precompile additional assets.
# By default, Rails only precompiles application.js, application.css, and non-JS/CSS files in app/assets.
# If you have specific assets you want precompiled, add them here.
# For example:
# Rails.application.config.assets.precompile += %w( custom.js custom.css )

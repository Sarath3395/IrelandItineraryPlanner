# Be sure to restart your server when you modify this file.

# Specify a serializer for the signed and encrypted cookie jars.
# Valid options are :json, :marshal, and :hybrid.
Rails.application.config.action_dispatch.cookies_serializer = :json
Rails.application.config.action_dispatch.signed_cookie_digest = "SHA256"

Rails.application.config.action_dispatch.cookies_rotations.tap do |cookies|
  cookies.rotate :signed, digest: "SHA1"
end
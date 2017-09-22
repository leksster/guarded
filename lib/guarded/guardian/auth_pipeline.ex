defmodule Guarded.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :guarded,
    module: GuardedWeb.Guradian,
    error_handler: GuardedWeb.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}, realm: :none
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, ensure: true
end

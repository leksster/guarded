defmodule Guarded.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :guarded,
    module: Guarded.Guardian,
    error_handler: GuardedWeb.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, claims: %{typ: "access"}
  plug Guardian.Plug.LoadResource, ensure: true
end

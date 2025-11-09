# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # Development
    origins "http://localhost:3000",
            "http://localhost:3001",
            # Production API URL
            "https://intern-matching-api.onrender.com",
            # Production Frontend URL
            ENV.fetch("FRONTEND_URL", "https://intern-matching-web.vercel.app")

    resource "*",
      headers: :any,
      methods: [ :get, :post, :put, :patch, :delete, :options, :head ],
      credentials: true
  end
end

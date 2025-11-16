# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # Development
    origins "http://localhost:3000",
            "http://localhost:3001",
            "https://intern-matching-web.vercel.app"

    resource "*",
      headers: :any,
      methods: [ :get, :post, :put, :patch, :delete, :options, :head ],
      credentials: true
  end
end

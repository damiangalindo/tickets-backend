module API
  module V1
    class Base < Grape::API
      mount API::V1::Tickets
      mount API::V1::Users
      mount API::V1::Responses

      add_swagger_documentation(
        info: {
          title: 'Tickets Backend Service',
          description: 'A service to process tickets and manage users',
          contact_name: 'Damian Galindo',
          contact_email: 'damiangalindomeza@gmail.com',
          contact_url: 'Contact URL',
          license: 'The name of the license.',
          license_url: 'www.The-URL-of-the-license.org'
        },
        hide_documentation_path: true,
        api_version: 'v1',
        base_path: '/api',
        hide_format: true
      )
    end
  end
end

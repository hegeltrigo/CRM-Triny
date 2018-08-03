
role :app, %w{deploy@45.33.25.168}
role :web, %w{deploy@45.33.25.168}
role :db,  %w{deploy@45.33.25.168}

set :branch, 'master'
set :rails_env, 'production'

server '45.33.25.168', user: 'deploy', roles: %w{web app}, my_property: :my_value

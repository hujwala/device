set :stage, :test
set :branch, :master
set :deploy_to, '/home/deploy/u01/apps/qwinix/timesheet'
set :user, "deploy"
role :app, %w{deploy@52.3.234.120}
role :web, %w{deploy@52.3.234.120}
role :db,  %w{deploy@52.3.234.120}
server '52.3.234.120', roles: %w{:web, :app, :db}, user: 'deploy'
set :ssh_options,
 {keys: %w(~/.ssh/id_rsa),
  auth_methods: %w(publickey)}

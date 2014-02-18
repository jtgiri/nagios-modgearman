CHEF_REPO = File.expand_path('../..', __FILE__)
CHEF_DIR  = File.join CHEF_REPO, '.chef'
chef_server_url        'http://127.0.0.1:8889'
client_key             "#{CHEF_DIR}/client.pem"
node_name              'host'
validation_client_name 'validator'
validation_key         "#{CHEF_DIR}/validator.pem"
chef_repo_path         CHEF_REPO

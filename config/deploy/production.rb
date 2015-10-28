# Production deploy
# ==================
USER = 'zeal'
SERVER = '195.64.206.94'
APP_SRV = "#{USER}@#{SERVER}"

role :app, APP_SRV
role :web, APP_SRV
role :db,  APP_SRV
set :stage, :production
set :deploy_to, "/home/#{USER}/tataurovv/sites"

server SERVER, user: USER, roles: %w{web app}

# Lighting Service Setup
git clone https://github.com/northcoders/ce-project-lights.git &&

cd ce-project-lighting &&

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash &&
. ~/.nvm/nvm.sh &&
nvm install --lts &&
npm install pm2@latest -g &&
npm i &&
pm2 start npm -- run start &&
pm2 startup &&
pm2 save


# Heating Serivce Setup
git clone https://github.com/northcoders/ce-project-heating.git &&

cd ce-project-heating &&

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash &&
. ~/.nvm/nvm.sh &&
nvm install --lts &&
npm install pm2@latest -g &&
npm i &&
pm2 start npm -- run start &&
pm2 startup &&
pm2 save


# Status Service Setup
git clone https://github.com/northcoders/ce-project-status.git &&

cd ce-project-status &&

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash &&
. ~/.nvm/nvm.sh &&
nvm install --lts &&
npm install pm2@latest -g &&
npm i &&
pm2 start npm -- run start &&
pm2 startup &&
pm2 save
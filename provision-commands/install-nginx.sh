# Install Nginx
sudo add-apt-repository -y ppa:ondrej/nginx-mainline # Super Latest Version
sudo apt-get update
sudo apt-get -y install nginx
sudo systemctl enable nginx

# Rename html to public
mv /var/www/html /var/www/public

# # Make sure your web server knows you did this...
# MY_WEB_CONFIG='server {
#     listen 80 default_server;
#     listen [::]:80 default_server;
#     root /var/www/public;
#     index index.html index.htm index.nginx-debian.html;
#     server_name _;
#     location = /favicon.ico { access_log off; log_not_found off; }
#     location = /robots.txt  { access_log off; log_not_found off; }
#     location / {
#         try_files $uri $uri/ /index.php?$query_string;
#     }
# }'
# echo "$MY_WEB_CONFIG" | sudo tee /etc/nginx/sites-available/default

sudo systemctl restart nginx

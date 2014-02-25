#!/bin/bash

echo "
	         _____              _____                _____      _               
	        / ____|            |  __ \              / ____|    | |              
	  _ __ | |  __  ___ _ __   | |  | | _____   __ | (___   ___| |_ _   _ _ __  
	 | '_ \| | |_ |/ _ \ '_ \  | |  | |/ _ \ \ / /  \___ \ / _ \ __| | | | '_ \ 
	 | | | | |__| |  __/ | | | | |__| |  __/\ V /   ____) |  __/ |_| |_| | |_) |
	 |_| |_|\_____|\___|_| |_| |_____/ \___| \_/   |_____/ \___|\__|\__,_| .__/ 
	                                                                     | |    
	                                                                     |_|    


                                                            by tburial
"

echo "Please enter your server name: $URL"
read URL

echo "Please enter your application path (ex ngen/public): $APP_PATH"
read APP_PATH

sudo cat<<EOF > /etc/nginx/conf.d/$URL.conf 
server {
    server_name $URL;
    root /home/public_html/$APP_PATH;

    index index.php index.html;

    # serve static files directly
    location ~* \.(jpg|jpeg|gif|css|png|js|ico|html)$ {
            access_log off;
            expires max;
    }

    # removes trailing slashes (prevents SEO duplicate content issues)
    if (!-d \$request_filename)
    {
            rewrite ^/(.+)/$ /\$1 permanent;
    }

    # enforce NO www
    if (\$host ~* ^www\.(.*))
    {
        set \$host_without_www \$1;
        rewrite ^/(.*)$ \$scheme://\$host_without_www/\$1 permanent;
    }
    
    # canonicalize codeigniter url end points
    # if your default controller is something other than "welcome" you should change the following
    if (\$request_uri ~* ^(/lobby(/index)?|/index(.php)?)/?$)
    {
        rewrite ^(.*)$ / permanent;
    }

    # removes trailing "index" from all controllers
    if ($request_uri ~* index/?$)
    {
        rewrite ^/(.*)/index/?$ /\$1 permanent;
    }

    # unless the request is for a valid file (image, js, css, etc.), send to bootstrap
    if (!-e \$request_filename)
    {
        rewrite ^/(.*)$ /index.php?/\$1 last;
        break;
    }
    
    # catch all
    error_page 404 /index.php;

        location ~ \.php$ {
                try_files \$uri \$uri/ /index.php;
                fastcgi_pass   127.0.0.1:9000;
                fastcgi_index  index.php;
                fastcgi_param  SCRIPT_FILENAME   \$document_root\$fastcgi_script_name;
                include        fastcgi_params;
        }
}
EOF

echo "Restarting Services..."

sudo service nginx restart
sudo service php-fpm restart

echo "done setting up nginx -> setup mariadb:"

/usr/bin/mysql_secure_installation
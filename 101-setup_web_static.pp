# Configures a web server for deployment of web_static.

$nginx_conf = "server {
    listen 80 default_server;
    listen [::]:80 default_server;
    add_header X-Served-By ${hostname};
    root   /var/www/html;
    index  index.html index.htm;

    location /hbnb_static {
        alias /data/web_static/current;
        index index.html index.htm;
    }

    location /redirect_me {
        return 301 http://cuberule.com/;
    }

    error_page 404 /404.html;
    location /404 {
      root /var/www/html;
      internal;
    }
}"

package { 'nginx':
  ensure   => 'present',
  provider => 'apt'
} ->

file { '/data':
  ensure  => 'directory'
} ->

file { '/data/web_static':
  ensure => 'directory'
} ->

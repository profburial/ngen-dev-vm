# Basic nGen Dev VM

### OS: Centos 6.5

### Dependencies:
   - php 5.5
   - MariaDB 5.5
   - Nginx
   - ElasticSearch
   - Beanstalk Queue

### Use

Make sure you have [vagrant](http://vagrantup.com) installed. Clone and run `vagrant up`. Puppet takes care of most everything for you. 

### Notes

Feel free to edit `VagrantFile` as you see fit.

You're going to need to setup vhosts as you need them. 

All you should have to do is `cp /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/whatever-dev.conf` and then edit the new vhost to your liking. 
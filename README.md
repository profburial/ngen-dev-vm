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

### Setup

Once your box is built, run `vagrant ssh` and then `sudo ./ngen_dev_setup.sh`. This will walk you though setting up your vhosts and MariaDB.

To setup additional vhosts at a later time, run `sudo ./nginx_conf.sh`.

### Notes

Feel free to edit `VagrantFile` as you see fit.

Your vm will have a static ip of `192.168.56.101` unless you change it, and it assumes your synced folder is `~/php`. Change those values to whatever suits your needs.

** sync files not mounting **
`vagrant ssh` -> `sudo /etc/init.d/vboxadd setup` -> `logout` -> `vagrant reload`


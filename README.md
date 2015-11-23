# csgo-puppet
Counter Strike Global Offensive (csgo) puppet module

This is a module for installing steamcmd and starting a cs:go server.

These can be installed by moving the steamcmd folder and the csgo folder to your puppet module path.
This can be for example /etc/puppet/modules.

If you don't have puppet installed this can be done on debian based systems by running apt-get install puppet.

These modules can either be run in a multitude of ways.
The modules can be run once with puppet apply -e 'include steamcmd' and puppet apply -e 'include csgo'.
If you want the modules to be run on each puppet run you can include them in the site.pp file.

All parameters that can be passed to the modules such as map, download path, username, gametype and more is documented in the init.pp of the respective module.

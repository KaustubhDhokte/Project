exec 
{ 
	'mysqlexec_module':
	command=>'/usr/bin/puppet module install  --force runthebusiness-mysqlexec --version 1.0.2',
}
->
exec 
{ 
	'warning1':
	command=>'/bin/sed -i \'s/privileges/@privileges/g\' /etc/puppet/modules/mysqlexec/templates/userpresent.erb',
}
->
exec 
{ 
	'keystone':
	command=>'/usr/bin/puppet module install --force puppetlabs-keystone --version 2.2.0',
}
->
exec 
{ 
	'warning2':
	command=>'/bin/sed -i \'s/service-id/service_id/g\' /etc/puppet/modules/keystone/lib/puppet/provider/keystone_endpoint/keystone.rb',
}


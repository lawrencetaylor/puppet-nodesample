class nodesample() {

	exec  {"Download sample":
		command => "/usr/bin/git clone https://github.com/heroku/node-js-sample.git /home/vagrant/SampleSite",
		creates => "/home/vagrant/SampleSite",
		timeout => 0
	}

	exec {"Install express":
		command => "/usr/local/node/node-default/bin/npm install --prefix /home/vagrant/SampleSite express",
		timeout => 0
	}

	exec {"Install forever":
		command => "/usr/bin/sudo /usr/local/node/node-default/bin/npm install forever -g",
		timeout => 0
	}
	
	exec {"Start site":
		command => "/usr/local/node/node-default/bin/forever start /home/vagrant/SampleSite/index.js",
		timeout => 0,
		require => [ Exec["Download sample"], Exec["Install express"], Exec["Install forever"] ]
	}
}
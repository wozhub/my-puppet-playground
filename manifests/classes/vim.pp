
class vim {

    $paquetes_apt = ["vim", "exuberant-ctags", "git", "python-dev", "python-pip"]
    package {$paquetes_apt: ensure => installed }

    package { 'puppet-pip':
			ensure => installed,
			provider => gem,
			require => package['ruby']    }

    $paquetes_pip = ["dbgp", "vim-debug", "pep8", "flake8", "pyflakes", "isort"]
    package {$paquetes_pip:
		ensure => installed,
		provider => pip,
		require => package['puppet-pip']    }
}

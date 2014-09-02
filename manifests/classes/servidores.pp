
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] } 

class servidor {
    package { 'htop': ensure => installed }
    package { 'unzip': ensure => installed }
    package { 'ruby': ensure => installed }
    package { 'mosh': ensure => installed }
}

class servidor::web inherits servidor {  }
class servidor::web::apache inherits servidor::web {
    package { 'apache2': ensure => installed }
}
class servidor::web::lighttp inherits servidor::web {  }


class servidor::db inherits servidor {  }

class servidor::db::pgsql inherits servidor::db {
    package { ['postgresql', 'postgresql-client', 'postgresql-contrib']: ensure => installed }
}

class servidor::db::pgsql::postgis inherits servidor::db::pgsql {  
    package { ['postgis', 'postgresql-9.3-postgis-2.1']: ensure => installed }

    file { '/var/lib/postgresql/instalar_template.sh':
            mode    => 550,
            owner   => postgres,
            group   => postgres,
            source  => 'puppet:///files/instalar_template.sh'
    }

    exec { 'deploy_template':
            user => postgres,
            command => '/var/lib/postgresql/instalar_template.sh'
    }
    
}

class servidor::db::mysql inherits servidor::db {  }


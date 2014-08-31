
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
class servidor::db::pgsql inherits servidor::db {  }
class servidor::db::mysql inherits servidor::db {  }


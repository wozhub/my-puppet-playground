
import "classes/*"

node default {
    include servidor
    include vim
}

node slave {
    include servidor::web::apache
    include servidor::db::pgsql::postgis
}

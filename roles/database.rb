name "database"
description "MySql servers"
run_list "role[base]", "recipe[mysql]"

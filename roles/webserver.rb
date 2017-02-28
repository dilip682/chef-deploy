name "webserver"
description "Apache webserver role"
run_list "role[base]", "recipe[apache]"

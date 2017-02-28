name "base"
description "Base Role - Contains recipes that need to be run ono all nodes"
run_list "recipe[chef-client::delete_validation]","recipe[chef-client::cron]","recipe[chef-client]","recipe[localusers]"

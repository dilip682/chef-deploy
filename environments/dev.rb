name "dev"
description "This is the development environment"
cookbook "apache", "= 0.1.5"

default_attributes({
  "author" => {
    "name" => "Dilip Huddar @ Env"
    }
  }
)


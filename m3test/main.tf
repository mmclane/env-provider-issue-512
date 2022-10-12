# This should match the name of the directory which should also match the name of a project in env0
# The project should already have been defined (and built) in the ../projects directory

data "env0_project" "this" {
  name = "m3test"
}

data "env0_template" "nothing" {
  name = "nothing"
}

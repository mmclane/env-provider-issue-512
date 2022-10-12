resource "env0_environment" "nothing" {
  name       = "m3test-nothing-test2"
  project_id = data.env0_project.this.id

  template_id                = data.env0_template.nothing.id
  workspace                  = "test2"
  approve_plan_automatically = true
  deploy_on_push             = true
  force_destroy              = true
  run_plan_on_pull_requests  = true
}

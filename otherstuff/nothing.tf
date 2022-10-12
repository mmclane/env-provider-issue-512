resource "env0_environment" "nothing" {
  name       = "other-nothing-test"
  project_id = data.env0_project.this.id

  template_id                = data.env0_template.nothing.id
  workspace                  = "other"
  approve_plan_automatically = true
  deploy_on_push             = true
  force_destroy              = true
  run_plan_on_pull_requests  = true
}

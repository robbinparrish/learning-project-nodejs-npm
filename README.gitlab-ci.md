## learning-project-nodejs-npm gitlab CI config.

### Pre-requists for pipeline.
  - Release branches - "/^v+\d+\.+\d+\.+\d+$/" and "main"
  - PROJECT_ACCESS_TOKEN - Access Token for Project to create Tag. Must be preconfigured in CI Variables.

### As a templates following stages are added to the .gitlab-ci.yml file.
  - generate_version_id - Generate version number ID.
  - release_version_id - Release version ID.

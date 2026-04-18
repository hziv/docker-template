# Docker Template

Windows and Mac Docker Template for Python development

## Usage

1. Create a new repository on GitHub
1. Clone new repo onto local machine by running `git clone https://<gph_token>@github.com/<user>/<repo>.git`
1. Set `docker-template` as `upstream` remote by running `git remote add template https://<gph_token>@github.com/hziv/docker-template.git`
1. When wanting to fetch and update from template repo run: `git fetch template` followed by `git merge template/main --allow-unrelated-histories —squash`
1. *Remember* to `push` to your new repo after `merge`.

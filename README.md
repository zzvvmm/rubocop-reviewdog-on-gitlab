Currenty, the `reviewdog` does not fully support **code suggestion** on GitLab yet ([can check the progess here](https://github.com/reviewdog/reviewdog/issues/678#issue-663125434)).  
But with some additional work, we still can run Rubocop reviewdog with code suggestion smoothly. This repository shows how to do that.
### Setup
- Creating a personal access token
  - Create a personal access token at https://gitlab.com/-/profile/personal_access_tokens
  - Use the created token as CI/CD variable in `Project Settings => CI/CD => variables`:
    - The key of the variable is REVIEWDOG_GITLAB_API_TOKEN
    - The value is the token just created.
 - Copy `.gitlab-ci.yml` to your project (or modify your current `.gitlab-ci.yml` to add the `run_reviewdog` stage)
 - If your main/base branch is `master`, your setup is done here, you can create an merge request and watch the GitLabCI job running reviewdog. Otherwise follow that:
   - Edit branch name in this line to your main branch (e.g. `main`)  
   https://github.com/zzvvmm/rubocop-reviewdog-on-gitlab/blob/24d9c2d54d1e2b59a3f4e25be0bf9c624f5893a6/run-reviewdog.sh#L4
   - Rebuild the docker image with the Dockerfile in this repository
   - Use your built docker image in GitLabCI job  
   https://github.com/zzvvmm/rubocop-reviewdog-on-gitlab/blob/24d9c2d54d1e2b59a3f4e25be0bf9c624f5893a6/.gitlab-ci.yml#L7
   - (Or you can just edit the branch name then copy it directly to your project and modify the script path to the new path)
### Example usage
<img width="905" alt="image" src="https://user-images.githubusercontent.com/26274752/208006672-d77d2b0c-964e-4e55-bfbc-e9764f6dc4aa.png">

[Merge Request](https://gitlab.com/zzvvmm/rubocop-reviewdog-on-gitlab/-/merge_requests/1)   
[GitLabCI job](https://gitlab.com/zzvvmm/rubocop-reviewdog-on-gitlab/-/jobs/3481562723)  

### Ref
- [reviewdog](https://github.com/reviewdog/reviewdog)
- [reviewdog code suggestion work progress](https://github.com/reviewdog/reviewdog/issues/678#issue-663125434)
- [Rubocop reviewdog in Github Action](https://github.com/reviewdog/action-rubocop)
- [Speed up Rubocop reviewdog](https://blog.bhanunadar.com/how-to-optimise-rubocop-reviewdog-github-action-to-execute-faster/)
- [Issue: reviewdog suggestion in GitLab does not respect the column](https://github.com/reviewdog/reviewdog/issues/1282#issuecomment-1354149286)

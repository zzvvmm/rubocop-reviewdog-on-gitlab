### Creating a personal access token
- Create a personal access token at https://gitlab.com/-/profile/personal_access_tokens
- Use the created token as CI/CD variable in `Project Settings => CI/CD => variables`:
  - The key of the variable is REVIEWDOG_GITLAB_API_TOKEN
  - The value is the token just created.

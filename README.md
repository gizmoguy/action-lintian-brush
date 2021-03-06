# action-lintian-brush

Github action that runs lintian-brush to automatically fix some common issues
in Debian packages.

## Inputs

### `git-user-name`

Username to use for git commits.

Defaults to lintian-brush.

### `git-user-email`

Email address to use for git commits.

Defaults to noreply@github.com.

### `directory`

Set lintian-brush --directory option.

Directory to run in.

Defaults to unset.

### `no-update-changelog`

Set lintian-brush --no-update-changelog option.

Do not update the changelog.

Defaults to false.

### `modern`

Set lintian-brush --modern option.

Use features/compatibility levels that are not available in stable.
(makes backporting harder)

Defaults to false.

## Example usage

This is a complete example demonstrating how to run lintian-brush once per day,
and automatically raising a PR with any recommended changes.

```
name: Lintian-brush

on:
  schedule:
    # Schedule to run at midnight every day
    - cron: '0 0 * * *'

jobs:
  lintian-brush:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repo
        uses: actions/checkout@v2
        with:
          fetch-depth: 0
      - name: Run lintian-brush
        uses: wanduow/action-lintian-brush@v1
      - name: Create pull request
        uses: peter-evans/create-pull-request@v3
        with:
          branch: lintian-brush/patch
          title: 'Update debian packaging'
          body: |
            Automated changes by [lintian-brush][1]
            [1]: https://salsa.debian.org/jelmer/lintian-brush
```

It is also possible to override the default settings, such as setting the
username and email address is used to make the git commits:

```
      - name: Run lintian-brush
        uses: wanduow/action-lintian-brush@v1
        with:
          git-user-name: GitHub
          git-user-email: noreply@github.com
```

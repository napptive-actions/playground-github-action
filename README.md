# PLAYGROUND-GITHUB-ACTIONS

With playground github action you will execute a Napptive playground command.

Napptive playground simplifies the process to depoy and maintenance cloud-native applications. [Try for free!!](https://playground.napptive.dev/login)

## Environment variable

### `PLAYGROUND_PAT`

This environment variable contains a [Napptive Personal Access Token](https://docs.napptive.com/guides/Using_personal_access_tokens.html) used to login to the platform.

## Inputs

### `cmd`

The playground command to run. This input is __required__

### `environment`

To specify a target account/environment if proceed. No __required__ input.

### `playgroundConfigFile`

To use a custom YAML file to change the target playground installation. No __required__
This file contains a playground installation configuration. Visit [documentation](https://docs.napptive.com/playground/On_premise_configuration.html#configuration-file) for an example.

## Example usage

```bash
name: List deployed applications
on: [push]
jobs:
  deploy:
    name: Playground List applications
    runs-on: ubuntu-latest
    steps:
      # Get a copy of the repo.
      - uses: actions/checkout@v2
      # Execute `playground apps`.
      - uses: napptive-actions/playground-github-action@v4.2.0
        env:
          PLAYGROUND_PAT: ${{ secrets.PLAYGROUND_PAT }}
        with:
          cmd: "apps"
```

## License

Copyright 2020 Napptive

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.

You may obtain a copy of the License at [https://www.apache.org/licenses/LICENSE-2.0](https://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

See the License for the specific language governing permissions and
limitations under the License.

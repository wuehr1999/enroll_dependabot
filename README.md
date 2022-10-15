# Automatic enroller

Enroll dependabot automatically for multiple github repos by creating a new branch and initiating a pull request.

## Installation

Install gh:
~~~bash
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
~~~

Authenticate in gh:
~~~bash
gh auth login
~~~

## Usage

Place the URLs for all repositories in the ```REPOS``` array in ```repos.sh``` .

Enroll dependabot:
~~~bash
./enroll.sh
~~~

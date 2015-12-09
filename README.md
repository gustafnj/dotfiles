Set of *rc files and an ansible playbook for setting up new development environments.

Installation (OSX):
* Install Xcode command line tools: 
  `xcode-select install`
* Install Homebrew:
  `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
* Install ansible (from repo root dir):
  `./install_ansible.sh`
* Configure dev environment`
  `ansible-playbook -i inventory --connection=local --ask-sudo-pass ansible-laptop.yaml`

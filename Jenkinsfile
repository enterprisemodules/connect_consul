#!groovy

def unitTest(String rubyVersion = '1.9.3', String puppetVersion = '3.7.3') {
  node(label: 'testslave') {
    checkout scm
    def String setup = """/bin/bash -lc 'echo Package installation && \
    export PUPPET_GEM_VERSION=${puppetVersion} && \
    export BUNDLE_GEMFILE=./gemfiles/gemfile.1.9.3 && \
    export GIT_SSH_COMMAND=(ssh -i /home/jenkins/.ssh/id_rsa) && \
    rvm use ${rubyVersion} && ruby --version && \
    mkdir -p spec/fixtures && \
    gem install bundler && \
    bundle install && \
    ssh-keyscan -H github.com >> ~/.ssh/known_hosts && \
    echo unit test start && \
    bundle exec rake spec'"""
    sh setup
  }
}

pipeline {
  agent none
  triggers {
    cron('H H * * *')
  }
  stages {
    stage('Unit tests') {
      steps {
        parallel(
          "Ruby 1.9.3 - Puppet 3.7.4":  { unitTest('1.9.3', '3.7.4', '1.3.4') },
          "Ruby 1.9.3 - Puppet 3.7.5":  { unitTest('1.9.3', '3.7.5', '1.3.4') },
          "Ruby 1.9.3 - Puppet 3.8.4":  { unitTest('1.9.3', '3.8.4', '1.3.4') },
          "Ruby 1.9.3 - Puppet 4.0.0":  { unitTest('1.9.3', '4.0.0', '2.0.0') },
          "Ruby 1.9.3 - Puppet 4.1.0":  { unitTest('1.9.3', '4.1.0', '2.0.0') },
          "Ruby 1.9.3 - Puppet 4.2.3":  { unitTest('1.9.3', '4.2.3', '2.0.0') },
          "Ruby 1.9.3 - Puppet 4.3.2":  { unitTest('1.9.3', '4.3.2', '3.1.1') },
          "Ruby 1.9.3 - Puppet 4.4.2":  { unitTest('1.9.3', '4.2.2', '3.1.1') },
          "Ruby 1.9.3 - Puppet 4.5.2":  { unitTest('1.9.3', '4.5.2', '3.1.1') },
          "Ruby 2.0.0 - Puppet 3.7.3":  { unitTest('3.1.1', '3.7.3', '3.1.1') },
          "Ruby 2.0.0 - Puppet 3.7.5":  { unitTest('3.1.1', '3.7.5', '3.1.1') },
          "Ruby 2.0.0 - Puppet 3.8.4":  { unitTest('3.1.1', '3.8.4', '3.1.1') },
          "Ruby 2.0.0 - Puppet 4.0.0":  { unitTest('3.1.1', '4.0.0', '3.1.1') },
          "Ruby 2.0.0 - Puppet 4.1.0":  { unitTest('3.1.1', '4.1.0', '3.1.1') },
          "Ruby 2.0.0 - Puppet 4.2.3":  { unitTest('3.1.1', '4.0.0', '3.1.1') },
          "Ruby 2.0.0 - Puppet 4.3.2":  { unitTest('3.1.1', '4.3.2', '3.1.1') },
          "Ruby 2.0.0 - Puppet 4.4.2":  { unitTest('3.1.1', '4.4.2', '3.1.1') },
          "Ruby 2.0.0 - Puppet 4.5.2":  { unitTest('3.1.1', '4.5.2', '3.1.1') },
          "Ruby 2.1.10 - Puppet 3.7.3": { unitTest('2.1.10', '4.7.3', '3.1.1') },
          "Ruby 2.1.10 - Puppet 3.7.4": { unitTest('2.1.10', '3.7.4', '3.1.1') },
          "Ruby 2.1.10 - Puppet 3.7.5": { unitTest('2.1.10', '3.7.5', '3.1.1') },
          "Ruby 2.1.10 - Puppet 3.8.4": { unitTest('2.1.10', '3.8.4', '3.1.1') },
          "Ruby 2.1.10 - Puppet 4.0.0": { unitTest('2.1.10', '4.0.0', '3.1.1') },
          "Ruby 2.1.10 - Puppet 4.1.0": { unitTest('2.1.10', '4.1.0', '3.1.1') },
          "Ruby 2.1.10 - Puppet 4.2.3": { unitTest('2.1.10', '4.2.3', '3.1.1') },
          "Ruby 2.1.10 - Puppet 4.3.2": { unitTest('2.1.10', '4.3.2', '3.1.1') },
          "Ruby 2.1.10 - Puppet 4.4.2": { unitTest('2.1.10', '4.4.2', '3.1.1') },
          "Ruby 2.1.10 - Puppet 4.5.2": { unitTest('2.1.10', '4.5.2', '3.1.1') },
          "Ruby 2.4.0 - Puppet 5.0.0":  { unitTest('2.4.0', '5.0.0', '3.1.1') }
        )
      }
    }
  }
}

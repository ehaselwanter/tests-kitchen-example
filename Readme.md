tests-kitchen-example
===================

This are the integration tests for the projects

- https://github.com/ehaselwanter/puppet-kitchen-example
- https://github.com/ehaselwanter/chef-kitchen-example

Have a look at:

- [Using Test Kitchen With Puppet](http://ehaselwanter.com/en/blog/2014/05/08/using-test-kitchen-with-puppet/)
- [Integration Testing Infrastructure As Code With Chef Puppet And KitchenCI](http://ehaselwanter.com/en/blog/2014/06/03/integration-testing-infrastructure-as-code-with-chef-puppet-and-kitchenci/)

they start at `integration` level

you can use the gem `kitchen-sharedtests`

- https://github.com/ehaselwanter/kitchen-sharedtests/

to make them available to your project. Use `thor kitchen:fetch-remote-tests` to put the repo into `test/integration`  

you can target the integration tests to any host were you have ssh access

rake -T gives you a list of suites you can run (well ignore directories which are obviously not suites for now)

```
± rake -T
rake serverspec:data_bags  # Run serverspec suite data_bags
rake serverspec:default    # Run serverspec suite default
```

run it with:

```
bundle install

# default user and ssh-key

bundle exec rake serverspec:default target_host=<name-or-ip-of-target-server>

# or with user, host, password

ASK_LOGIN_PASSWORD=true bundle exec rake serverspec:default target_host=192.168.1.222 user=stack
```

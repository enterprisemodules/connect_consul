[![Build Status](https://travis-ci.org/hajee/connect_consul.png?branch=master)](https://travis-ci.org/hajee/connect_consul) [![Coverage Status](https://coveralls.io/repos/hajee/connect_consul/badge.svg)](https://coveralls.io/r/hajee/connect_consul)[![Code Climate](https://codeclimate.com/github/hajee/connect_consul/badges/gpa.svg)](https://codeclimate.com/github/hajee/connect_consul)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What Consul importer for Connect does and why it is useful](#module-description)
3. [Setup - The basics of getting started with the Consul importer for Connect](#setup)
    * [What connect affects](#what-connect-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with the Consul importer for Connect](#beginning-with-connect)
    * [Tools](#tools)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Troubleshooting](#troubleshooting)
6. [Limitations - OS compatibility, etc.](#limitations)
7. [Development - Guide for contributing to the module](#development)
    * [OS support](#os-support)
    * [Tests - Testing your configuration](#testing)

## Overview

[Connect](https://github.com/hajee/connect) is a replacement for YAML in hiera when using Puppet. Connect allows you to manipulate and import data from external sources. These importers are add-on extensions for Connect.

This module contains an importer to import values and services from [Consul](https://www.consul.io/)

## Module Description

Using this module, you can import service data and data from the Consul key value store seamlessly in your Puppet manifests. This allows you to build dynamic manifests. For example if you store all information regarding font-end load balancers in Consul, you can use this Connect data source to fetch the current data from Consul and configure your applications accordingly. Changes in health of your load balancers are noticed by Consul. If Consul decides a service is not healthy anymore, it removes the server from the list of services. On every new Puppet run, Consul is queried, and the last changes in health are propagated to your Puppet manifest and resulting configuration.

## Example

With this import, you can use service information stored in Consul, to configure your system. Here's an example:

```ruby
import from consul_service_store do
  redis = 'redis'
end
```

This code imports the service information stored in the default Consul server into the connect variable `redis`. Consul returns a data structure with all available information. You can use or extract this information, using this code:

```ruby
with redis:: do
  service_id   = redis.ServiceID
  address      = redis.Address
  service_tags = redis.ServiceTags
  node         = redis.Node
  service_name = redis.ServiceName
  service_port = redis.ServicePort
end
```

The Consul value store is flatter and even easier to use:

```ruby
import from consul_value_store do
  foo = 'foo'
end
```

This fetches the value with key `foo` from Consul and stores it into the connect variable `foo`


## Setup

### Installing the module

To use the connect hiera module, you first have to make sure it is installed.

```sh
puppet module install hajee/connect_consul
```

If you are using a Puppetfile, you need the following lines:

```
mod 'hajee-connect_consul'
```

### What connect_consul affects

### Setup Requirements

To use this module, you need to have the ruby gem `diplomat` installed:

```sh
$ gem install diplomat
```

The `diplomat`  gem requires Ruby 1.9 or higher.

### Beginning with connect Consul module


## Detailed description

Check [the Connect Language, in a Nutshell](https://github.com/hajee/connect/blob/master/doc/nutshell.md), for more intro into the language.

## Troubleshooting

Your Consul server needs to run properly. Check the function of Consul by querying it directly. For a service use:

```sh
$ curl http://<consul_server>:8500/v1/catalog/service/<service_name>
```

For a key with value use:

```sh
http://localhost:8500/v1/kv/?recurse
$  curl http://<consul_server>:8500/v1/kv/<key>
```

## Limitations

This module is tested CentOS and Redhat. It will probably work on other Linux distributions.

## Development

This is an open source project, and contributions are welcome.

### OS support

Currently we have tested:

* CentOS 5
* Redhat 5

### Testing

Make sure you have:

* rake
* bundler

Install the necessary gems:

    bundle install

And run the tests from the root of the source code:

    rake spec

We are currently working on getting the acceptance test running as well.

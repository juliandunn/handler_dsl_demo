# Event Handler DSL Demo

Chef Client 12.5 includes a new DSL that makes it easier for users
to attach actions to an event within the Chef Client run. You could
also regard these as "event callbacks", i.e. do something upon 
encountering an event during the Chef Client run.

Previously, you would have had to write a [full-blown event or report
handler](https://docs.chef.io/handlers.html), and register it with the
Chef Client during the run. Not only is this cumbersome, but also leads
to timing problems. For example, registering a new handler as step 5 of
a run list means that any events of interest that happened during steps
1-4 won't get processed by that handler.

Some examples of use cases for handlers:

* Notify a chat system when a run fails
* Send # of updated resources and/or timing information about a successful run to statsd
* Lock a global mutex in etcd when a run starts. Release it when done.

For more information on this feature, please read [RFC-039](https://github.com/chef/chef-rfc/blob/master/rfc039-event-handler-dsl.md) or the Chef
docs.

## License and Authors

* Author:: Chef Software, Inc. (<jdunn@chef.io>)
* License:: Apache 2.0

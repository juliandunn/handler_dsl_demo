#
# Cookbook Name:: handler_dsl_demo
# Recipe:: default
#
# Copyright (C) 2015 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# You can put any Ruby in the block.
Chef.event_handler do
  on :converge_start do
    puts "Ohai! I have started a converge."
  end
end

# You can also invoke methods inside libraries.
# Just remember that Chef.run_context may not be fully populated based
# on the type of event you're trying to hook into.
Chef.event_handler do
  on :run_failed do
    HandlerDemo::Helper.new.send_email_on_failure(Chef.run_context.node.name)
  end
end

# Let's cause an exception so that we get an email.
ruby_block 'fail the run to show off the foregoing' do
  block do
    fail 'deliberately failing the run'
  end
end

#
# Cookbook Name:: nagios-modgearman
# Recipe:: default
#
# Copyright (C) 2014 nclouds.com
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

include_recipe "apt"

users_manage "sysadmin" do
  group_id 2300
  action [ :remove, :create ]
end

include_recipe "nagios::client"

%w{libnagios-plugin-perl nagios3-core nagios3-common nagios-nrpe-plugin}.each do |pkg|
  package pkg do
    action :install
  end
end


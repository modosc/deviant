#!/usr/bin/env rake
# -*- coding: utf-8 -*-
require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib/deviant'
  t.test_files = FileList['test/lib/deviant/*_test.rb']
  t.verbose = true
end

task :default => :test

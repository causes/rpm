# encoding: utf-8
# This file is distributed under New Relic's license terms.
# See https://github.com/newrelic/rpm/blob/master/LICENSE for complete details.

class FakeThread
  @@list = []

  def initialize(locals={}, &block)
    @locals = locals
    yield if block_given?
  end

  def self.current
    {}
  end

  def self.list
    @@list
  end

  def self.bucket_thread(thread, _)
    thread[:bucket]
  end

  def self.scrub_backtrace(thread, _)
    thread[:scrubbed_backtrace] || thread.backtrace
  end

  def key?(key)
    @locals.key?(key)
  end

  def [](key)
    @locals[key]
  end

  def backtrace
    @locals[:backtrace] || []
  end

  def join
  end
end

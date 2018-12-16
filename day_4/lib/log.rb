require 'time'

class Log
  DATA_REGEX = /\[(.+)\] (.*)/

  def initialize(raw_log)
    @time, @message = raw_log.match(DATA_REGEX).captures
  end

  def time
    Time.parse(@time)
  end

  def minute
    time.min
  end

  def new_shift?
    message.include?('begins shift')
  end

  def guard_id
    message.scan(/\d+/).first.to_i
  end

  private

  attr_reader :message
end

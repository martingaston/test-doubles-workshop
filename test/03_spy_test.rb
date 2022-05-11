require "minitest/autorun"
require "03_spy"

# ✍️ WRITE YOUR TEST DOUBLE HERE

# class MyCoolTestDouble
#   def cool_method
#     "cool"
#   end
# end

# ✍️ END

class TestAdderSpy < Minitest::Test
  def test_adder_is_fast
    # Arrange
    auditer = Auditer.new # 👈 this may have to change
    subject = Adder.new(auditer)
    stopwatch = Stopwatch.new

    # Act
    stopwatch.start
    subject.add(1, 2)
    stopwatch.stop

    # Assert
    assert stopwatch.elapsed < 0.5
  end

  def test_auditer_is_called
    # Arrange
    auditer = Auditer.new # 👈 this may have to change
    subject = Adder.new(auditer)

    # Act
    subject.add(1.2)

    # Assert
    assert auditer.was_called?
    assert_equal 2, auditer.calls[0].arguments.length
  end
end

class Stopwatch
  def initialize
    @started = nil
    @stopped = nil
  end

  def start
    raise "Stopwatch already started" unless !@started

    @started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  def stop
    raise "Stopwatch already stopped" unless !@stopped

    @stopped = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  def elapsed
    raise "Stopwatch not fully run" unless @stopped && @started

    @stopped - @started
  end
end

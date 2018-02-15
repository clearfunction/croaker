require "test_helper"

class CroakerTest < Minitest::Test
  def setup
    @klass = Croaker::Swallower
    @error =  StandardError.new 'Fake exception'
    @note = 'A test note'
  end

  def test_that_it_has_a_version_number
    refute_nil ::Croaker::VERSION
  end

  def test_it_logs_twice
    logger_mock = Minitest::Mock.new

    logger_mock.expect :tagged, nil, [String]
    logger_mock.expect :tagged, nil, [String]

    subject = @klass.new(error: @error, note: @note, logger: logger_mock)
    subject.call

    assert_mock logger_mock
  end

  def test_it_captures
  end

  def does_nothing_lol
    return
    logger_mock = Minitest::Mock.new
    capturer_mock = Minitest::Mock.new

    logger_mock.expect :error, nil, [{ note: 'this is a fake exception', message: err.message }]
    capturer_mock.expect :capture_exception, nil, [err]

    subject.stub :logger, logger_mock do
      subject.stub :capturer, capturer_mock do
        subject.call
      end
    end

    assert_mock logger_mock
    assert_mock capturer_mock
  end
end

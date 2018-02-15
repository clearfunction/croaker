require "croaker/version"

module Croaker
  # Your code goes here...
  def self.swallow(*args)
    Swallower.new(*args).call
  end

  class Swallower
    def initialize(error:, note:, logger: Rails.logger)
      @error = error
      @logger = logger
      @note = note
    end

    attr_reader :error, :note, :logger

    def call
      log(error: error, note: note)
      capture(error)
    end

    def log(error:, note:)
      message = "Unhandled error: [#{note}] [#{error.message}]"

      message += " #{error.backtrace.first}" if error.backtrace

      logger.tagged("Croaker") do
        logger.error message
      end
    end

    def capture(error)
      if capturer
        capturer.capture_error(error)
      else
        logger.tagged("Croaker") do
          logger.info "Not capturing this error - no error capturing service registered."
        end
      end
    end

    private

    def capturer
      defined?(::Raven) ? ::Raven : nil
    end
  end
end

require 'command'

module Commands
  class Left < ::Command

    def execute
      return unless valid?

      place_command.execute
    end

    def valid?
      @simulation.robot_placed?
    end

    private

    def place_command
      @place_command ||= Commands::Place.new(
        simulation: @simulation,
        arguments: @simulation.next_robot_position(:left).values
      )
    end
  end
end

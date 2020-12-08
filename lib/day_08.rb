module Day08
  Instruction = Struct.new(:operation, :argument, keyword_init: true)

  class BootCodeManager
    def initialize(boot_code:)
      @boot_code = parse_boot_code(boot_code)
    end

    def value_before_infinite_loop
      accumulator = 0
      position = 0
      visited_instructions = Set.new

      until visited_instructions.include?(position)
        visited_instructions.add(position)

        current_instruction = @boot_code[position]
        case current_instruction.operation
        when "nop"
          position += 1
        when "acc"
          accumulator += current_instruction.argument
          position += 1
        when "jmp"
          position += current_instruction.argument
        end
      end

      accumulator
    end

    private

    def parse_boot_code(boot_code)
      boot_code.map { |code|
        operation, argument = code.split(" ")
        Instruction.new(operation: operation, argument: argument.to_i)
      }
    end
  end
end

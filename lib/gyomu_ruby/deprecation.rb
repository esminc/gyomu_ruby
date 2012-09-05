module GyomuRuby
  module Deprecation
    module_function

    def deprecated_method_warning(method_name, message)
      warning = "DEPRECATIOPN WARNING:"
      warning = "#{warning} #{method_name} is deprecated and will be removed in the near future"
      warning = "#{warning} (#{message})"
      STDERR.puts(warning)
    end

    module DeprecatedConstant
      private

      def self.extended(constant)
        constant.instance_variable_set :@__new_constants, {}
      end

      def const_missing(name)
        return super unless constant = @__new_constants[name]

        STDERR.puts "DEPRECATIOPN WARNING: #{self.name}::#{name} is deprecated and will be removed in the near future(use #{constant.name} instead)"

        constant
      end

      def deprecated(name, new_constant)
        @__new_constants.update name => new_constant
      end
    end
  end
end

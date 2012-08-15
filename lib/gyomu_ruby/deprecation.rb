module GyomuRuby
  module Deprecation
    module_function
    def deprecated_method_warning(method_name, message)
      warning = "DEPRECATIOPN WARNING:"
      warning = "#{warning} #{method_name} is deprecated and will be removed in the near future"
      warning = "#{warning} (#{message})"
      STDERR.puts(warning)
    end
  end
end

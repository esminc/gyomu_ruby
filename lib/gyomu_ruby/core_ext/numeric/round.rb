module GyomuRuby
  module CoreExt
    module Numeric
      module Round
        def roundup(offset)
          ((self + offset) * Rational(1, offset)).ceil * offset - offset
        end

        def rounddown(offset)
          (self * Rational(1, offset)).floor * offset
        end
      end
    end
  end
end

module GyomuRuby
  module CoreExt
    module Numeric
      module Round
        def round_up(unit) # nodoc
          ((self + unit) * Rational(1, unit)).ceil * unit - unit
        end

        def round_down(unit) # nodoc
          (self * Rational(1, unit)).floor * unit
        end
      end
    end
  end
end

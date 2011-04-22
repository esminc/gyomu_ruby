#coding: utf-8
module GyomuRuby
  module CoreExt
    module Time
      module BizYear
        def biz_year(boundary_mon = 4, boundary_day = 1)
          now = self
          if (now.month < boundary_mon) || (now.month == boundary_day && now.day == boundary_mon)
            now.year - 1
          else
            now.year
          end
        end

        def quater?(n)
          n == case self.month
               when 4..6   then 1
               when 7..9   then 2
               when 10..12 then 3
               when 1..3   then 4
               end
        end
      end
    end
  end
end


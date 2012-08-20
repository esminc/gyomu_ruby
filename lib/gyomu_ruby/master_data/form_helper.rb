module GyomuRuby
  module MasterData
    module FormHelper
      include MasterData

      [:prefecture, :currency].each do |master|
        define_method %(options_for_#{master}_select) do
          data(master).invert.to_a
        end
      end
    end
  end
end

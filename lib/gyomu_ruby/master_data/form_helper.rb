module GyomuRuby
  module MasterData
    module FormHelper
      [:prefecture, :currency].each do |master|
        method_name = %(options_for_#{master}_select)

        define_method method_name do
          MasterData.data(master).invert.to_a
        end
        module_function method_name
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class FilterBcountryInput < FilterSelectInput
      include FilterBase
 
      def collection
        ::ActionView::Helpers::FormOptionsHelper::COUNTRIES
      end
 
    end
  end
end

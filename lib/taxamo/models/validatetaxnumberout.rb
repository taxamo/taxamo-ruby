# Copyright 2014-2015 Taxamo, Ltd.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Taxamo
class ValidateTaxNumberOut
  attr_accessor :tax_deducted, :buyer_tax_number, :buyer_tax_number_valid, :billing_country_code

  # :internal => :external
  def self.attribute_map
    {
      :tax_deducted => :tax_deducted,
      :buyer_tax_number => :buyer_tax_number,
      :buyer_tax_number_valid => :buyer_tax_number_valid,
      :billing_country_code => :billing_country_code

    }
  end

  def initialize(attributes = {})
    return if attributes.nil? or attributes.empty?
    # Morph attribute keys into undescored rubyish style
    if attributes.key?("tax_deducted")
      @tax_deducted = attributes["tax_deducted"]
        
    end
    if attributes.key?("buyer_tax_number")
      @buyer_tax_number = attributes["buyer_tax_number"]
        
    end
    if attributes.key?("buyer_tax_number_valid")
      @buyer_tax_number_valid = attributes["buyer_tax_number_valid"]
        
    end
    if attributes.key?("billing_country_code")
      @billing_country_code = attributes["billing_country_code"]
        
    end
    

  end

  def to_body
    body = {}
    self.class.attribute_map.each_pair do |key, value|
      v = self.send(key)
      unless v.nil?
        if v.is_a?(Array)
          array = Array.new
          v.each do |item|
            if item.respond_to?("to_body".to_sym)
              array.push item.to_body
            else
              array.push item
            end
          end
          body[value] = array
        else
          if v.respond_to?("to_body".to_sym)
            body[value] = v.to_body
          else
            body[value] = v
          end
        end
      end
    end
    body
  end
end
end

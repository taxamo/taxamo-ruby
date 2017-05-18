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
class InputTransactionLine
  attr_accessor :product_type, :deducted_tax_rate, :supply_date, :unit_price, :unit_of_measure, :quantity, :custom_fields, :line_key, :tax_name, :product_code, :amount, :custom_id, :informative, :tax_rate, :total_amount, :product_tax_code, :description

  # :internal => :external
  def self.attribute_map
    {
      :product_type => :product_type,
      :deducted_tax_rate => :deducted_tax_rate,
      :supply_date => :supply_date,
      :unit_price => :unit_price,
      :unit_of_measure => :unit_of_measure,
      :quantity => :quantity,
      :custom_fields => :custom_fields,
      :line_key => :line_key,
      :tax_name => :tax_name,
      :product_code => :product_code,
      :amount => :amount,
      :custom_id => :custom_id,
      :informative => :informative,
      :tax_rate => :tax_rate,
      :total_amount => :total_amount,
      :product_tax_code => :product_tax_code,
      :description => :description

    }
  end

  def initialize(attributes = {})
    return if attributes.empty?
    # Morph attribute keys into undescored rubyish style
    unless attributes["product_type"].nil?
      @product_type = attributes["product_type"]
        
    end
    unless attributes["deducted_tax_rate"].nil?
      @deducted_tax_rate = attributes["deducted_tax_rate"]
        
    end
    unless attributes["supply_date"].nil?
      @supply_date = attributes["supply_date"]
        
    end
    unless attributes["unit_price"].nil?
      @unit_price = attributes["unit_price"]
        
    end
    unless attributes["unit_of_measure"].nil?
      @unit_of_measure = attributes["unit_of_measure"]
        
    end
    unless attributes["quantity"].nil?
      @quantity = attributes["quantity"]
        
    end
    unless attributes["custom_fields"].nil?
      if (value = attributes["custom_fields"]).is_a?(Array)
          @custom_fields = value.map{ |v| CustomFields.new(v) }
        end
      end
    unless attributes["line_key"].nil?
      @line_key = attributes["line_key"]
        
    end
    unless attributes["tax_name"].nil?
      @tax_name = attributes["tax_name"]
        
    end
    unless attributes["product_code"].nil?
      @product_code = attributes["product_code"]
        
    end
    unless attributes["amount"].nil?
      @amount = attributes["amount"]
        
    end
    unless attributes["custom_id"].nil?
      @custom_id = attributes["custom_id"]
        
    end
    unless attributes["informative"].nil?
      @informative = attributes["informative"]
        
    end
    unless attributes["tax_rate"].nil?
      @tax_rate = attributes["tax_rate"]
        
    end
    unless attributes["total_amount"].nil?
      @total_amount = attributes["total_amount"]
        
    end
    unless attributes["product_tax_code"].nil?
      @product_tax_code = attributes["product_tax_code"]
        
    end
    unless attributes["description"].nil?
      @description = attributes["description"]
        
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

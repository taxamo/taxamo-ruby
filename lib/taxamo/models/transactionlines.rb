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
class TransactionLines
  attr_accessor :product_type, :deducted_tax_amount, :deducted_tax_rate, :supply_date, :id, :unit_price, :unit_of_measure, :quantity, :custom_fields, :line_key, :tax_name, :product_code, :amount, :custom_id, :informative, :tax_amount, :tax_rate, :additional_currencies, :total_amount, :product_tax_code, :refunded_tax_amount, :description, :refunded_total_amount

  # :internal => :external
  def self.attribute_map
    {
      :product_type => :product_type,
      :deducted_tax_amount => :deducted_tax_amount,
      :deducted_tax_rate => :deducted_tax_rate,
      :supply_date => :supply_date,
      :id => :id,
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
      :tax_amount => :tax_amount,
      :tax_rate => :tax_rate,
      :additional_currencies => :additional_currencies,
      :total_amount => :total_amount,
      :product_tax_code => :product_tax_code,
      :refunded_tax_amount => :refunded_tax_amount,
      :description => :description,
      :refunded_total_amount => :refunded_total_amount

    }
  end

  def initialize(attributes = {})
    return if attributes.empty?
    # Morph attribute keys into undescored rubyish style
    if attributes["product_type"]
      @product_type = attributes["product_type"]
        
    end
    if attributes["deducted_tax_amount"]
      @deducted_tax_amount = attributes["deducted_tax_amount"]
        
    end
    if attributes["deducted_tax_rate"]
      @deducted_tax_rate = attributes["deducted_tax_rate"]
        
    end
    if attributes["supply_date"]
      @supply_date = attributes["supply_date"]
        
    end
    if attributes["id"]
      @id = attributes["id"]
        
    end
    if attributes["unit_price"]
      @unit_price = attributes["unit_price"]
        
    end
    if attributes["unit_of_measure"]
      @unit_of_measure = attributes["unit_of_measure"]
        
    end
    if attributes["quantity"]
      @quantity = attributes["quantity"]
        
    end
    if attributes["custom_fields"]
      if (value = attributes["custom_fields"]).is_a?(Array)
          @custom_fields = value.map{ |v| CustomFields.new(v) }
        end
      end
    if attributes["line_key"]
      @line_key = attributes["line_key"]
        
    end
    if attributes["tax_name"]
      @tax_name = attributes["tax_name"]
        
    end
    if attributes["product_code"]
      @product_code = attributes["product_code"]
        
    end
    if attributes["amount"]
      @amount = attributes["amount"]
        
    end
    if attributes["custom_id"]
      @custom_id = attributes["custom_id"]
        
    end
    if attributes["informative"]
      @informative = attributes["informative"]
        
    end
    if attributes["tax_amount"]
      @tax_amount = attributes["tax_amount"]
        
    end
    if attributes["tax_rate"]
      @tax_rate = attributes["tax_rate"]
        
    end
    if attributes["additional_currencies"]
      @additional_currencies = AdditionalCurrencies.new(attributes["additional_currencies"])
        
    end
    if attributes["total_amount"]
      @total_amount = attributes["total_amount"]
        
    end
    if attributes["product_tax_code"]
      @product_tax_code = attributes["product_tax_code"]
        
    end
    if attributes["refunded_tax_amount"]
      @refunded_tax_amount = attributes["refunded_tax_amount"]
        
    end
    if attributes["description"]
      @description = attributes["description"]
        
    end
    if attributes["refunded_total_amount"]
      @refunded_total_amount = attributes["refunded_total_amount"]
        
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

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

class TransactionLines
  attr_accessor :custom_fields, :additional_currencies, :custom_id, :deducted_tax_amount, :product_type, :quantity, :tax_amount, :unit_price, :unit_of_measure, :total_amount, :tax_rate, :refunded_tax_amount, :line_key, :amount, :id, :refunded_total_amount, :informative, :description, :product_code, :supply_date, :tax_name

  # :internal => :external
  def self.attribute_map
    {
      :custom_fields => :custom_fields,
      :additional_currencies => :additional_currencies,
      :custom_id => :custom_id,
      :deducted_tax_amount => :deducted_tax_amount,
      :product_type => :product_type,
      :quantity => :quantity,
      :tax_amount => :tax_amount,
      :unit_price => :unit_price,
      :unit_of_measure => :unit_of_measure,
      :total_amount => :total_amount,
      :tax_rate => :tax_rate,
      :refunded_tax_amount => :refunded_tax_amount,
      :line_key => :line_key,
      :amount => :amount,
      :id => :id,
      :refunded_total_amount => :refunded_total_amount,
      :informative => :informative,
      :description => :description,
      :product_code => :product_code,
      :supply_date => :supply_date,
      :tax_name => :tax_name

    }
  end

  def initialize(attributes = {})
    return if attributes.empty?
    # Morph attribute keys into undescored rubyish style
    if attributes["custom_fields"]
      if (value = attributes["custom_fields"]).is_a?(Array)
          @custom_fields = value.map{ |v| CustomFields.new(v) }
        end
      end
    if attributes["additional_currencies"]
      @additional_currencies = AdditionalCurrencies.new(attributes["additional_currencies"])
        
    end
    if attributes["custom_id"]
      @custom_id = attributes["custom_id"]
        
    end
    if attributes["deducted_tax_amount"]
      @deducted_tax_amount = attributes["deducted_tax_amount"]
        
    end
    if attributes["product_type"]
      @product_type = attributes["product_type"]
        
    end
    if attributes["quantity"]
      @quantity = attributes["quantity"]
        
    end
    if attributes["tax_amount"]
      @tax_amount = attributes["tax_amount"]
        
    end
    if attributes["unit_price"]
      @unit_price = attributes["unit_price"]
        
    end
    if attributes["unit_of_measure"]
      @unit_of_measure = attributes["unit_of_measure"]
        
    end
    if attributes["total_amount"]
      @total_amount = attributes["total_amount"]
        
    end
    if attributes["tax_rate"]
      @tax_rate = attributes["tax_rate"]
        
    end
    if attributes["refunded_tax_amount"]
      @refunded_tax_amount = attributes["refunded_tax_amount"]
        
    end
    if attributes["line_key"]
      @line_key = attributes["line_key"]
        
    end
    if attributes["amount"]
      @amount = attributes["amount"]
        
    end
    if attributes["id"]
      @id = attributes["id"]
        
    end
    if attributes["refunded_total_amount"]
      @refunded_total_amount = attributes["refunded_total_amount"]
        
    end
    if attributes["informative"]
      @informative = attributes["informative"]
        
    end
    if attributes["description"]
      @description = attributes["description"]
        
    end
    if attributes["product_code"]
      @product_code = attributes["product_code"]
        
    end
    if attributes["supply_date"]
      @supply_date = attributes["supply_date"]
        
    end
    if attributes["tax_name"]
      @tax_name = attributes["tax_name"]
        
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


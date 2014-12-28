# Copyright 2014 Taxamo, Ltd.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class InputTransaction
  attr_accessor :invoice_date, :invoice_address, :buyer_credit_card_prefix, :custom_fields, :additional_currencies, :buyer_tax_number, :custom_id, :tax_country_code, :force_country_code, :buyer_email, :original_transaction_key, :buyer_ip, :invoice_place, :verification_token, :tax_deducted, :buyer_name, :evidence, :custom_data, :billing_country_code, :invoice_number, :currency_code, :description, :supply_date, :transaction_lines, :order_date

  # :internal => :external
  def self.attribute_map
    {
      :invoice_date => :invoice_date,
      :invoice_address => :invoice_address,
      :buyer_credit_card_prefix => :buyer_credit_card_prefix,
      :custom_fields => :custom_fields,
      :additional_currencies => :additional_currencies,
      :buyer_tax_number => :buyer_tax_number,
      :custom_id => :custom_id,
      :tax_country_code => :tax_country_code,
      :force_country_code => :force_country_code,
      :buyer_email => :buyer_email,
      :original_transaction_key => :original_transaction_key,
      :buyer_ip => :buyer_ip,
      :invoice_place => :invoice_place,
      :verification_token => :verification_token,
      :tax_deducted => :tax_deducted,
      :buyer_name => :buyer_name,
      :evidence => :evidence,
      :custom_data => :custom_data,
      :billing_country_code => :billing_country_code,
      :invoice_number => :invoice_number,
      :currency_code => :currency_code,
      :description => :description,
      :supply_date => :supply_date,
      :transaction_lines => :transaction_lines,
      :order_date => :order_date

    }
  end

  def initialize(attributes = {})
    return if attributes.empty?
    # Morph attribute keys into undescored rubyish style
    if attributes["invoice_date"]
      @invoice_date = attributes["invoice_date"]
        
    end
    if attributes["invoice_address"]
      @invoice_address = InvoiceAddress.new(attributes["invoice_address"])
        
    end
    if attributes["buyer_credit_card_prefix"]
      @buyer_credit_card_prefix = attributes["buyer_credit_card_prefix"]
        
    end
    if attributes["custom_fields"]
      if (value = attributes["custom_fields"]).is_a?(Array)
          @custom_fields = value.map{ |v| CustomFields.new(v) }
        end
      end
    if attributes["additional_currencies"]
      @additional_currencies = AdditionalCurrencies.new(attributes["additional_currencies"])
        
    end
    if attributes["buyer_tax_number"]
      @buyer_tax_number = attributes["buyer_tax_number"]
        
    end
    if attributes["custom_id"]
      @custom_id = attributes["custom_id"]
        
    end
    if attributes["tax_country_code"]
      @tax_country_code = attributes["tax_country_code"]
        
    end
    if attributes["force_country_code"]
      @force_country_code = attributes["force_country_code"]
        
    end
    if attributes["buyer_email"]
      @buyer_email = attributes["buyer_email"]
        
    end
    if attributes["original_transaction_key"]
      @original_transaction_key = attributes["original_transaction_key"]
        
    end
    if attributes["buyer_ip"]
      @buyer_ip = attributes["buyer_ip"]
        
    end
    if attributes["invoice_place"]
      @invoice_place = attributes["invoice_place"]
        
    end
    if attributes["verification_token"]
      @verification_token = attributes["verification_token"]
        
    end
    if attributes["tax_deducted"]
      @tax_deducted = attributes["tax_deducted"]
        
    end
    if attributes["buyer_name"]
      @buyer_name = attributes["buyer_name"]
        
    end
    if attributes["evidence"]
      @evidence = Evidence.new(attributes["evidence"])
        
    end
    if attributes["custom_data"]
      @custom_data = attributes["custom_data"]
        
    end
    if attributes["billing_country_code"]
      @billing_country_code = attributes["billing_country_code"]
        
    end
    if attributes["invoice_number"]
      @invoice_number = attributes["invoice_number"]
        
    end
    if attributes["currency_code"]
      @currency_code = attributes["currency_code"]
        
    end
    if attributes["description"]
      @description = attributes["description"]
        
    end
    if attributes["supply_date"]
      @supply_date = attributes["supply_date"]
        
    end
    if attributes["transaction_lines"]
      if (value = attributes["transaction_lines"]).is_a?(Array)
          @transaction_lines = value.map{ |v| InputTransactionLine.new(v) }
        end
      end
    if attributes["order_date"]
      @order_date = attributes["order_date"]
        
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


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

class Transactions
  attr_accessor :invoice_date, :invoice_address, :buyer_tax_number_valid, :manual, :buyer_credit_card_prefix, :custom_fields, :additional_currencies, :buyer_tax_number, :custom_id, :deducted_tax_amount, :tax_country_code, :force_country_code, :tax_amount, :tax_timezone, :buyer_email, :original_transaction_key, :test, :status, :create_timestamp, :total_amount, :tax_entity_name, :buyer_ip, :refunded_tax_amount, :countries, :invoice_place, :verification_token, :tax_deducted, :buyer_name, :confirm_timestamp, :evidence, :amount, :custom_data, :billing_country_code, :tax_supported, :invoice_number, :currency_code, :refunded_total_amount, :description, :supply_date, :transaction_lines, :order_date, :key

  # :internal => :external
  def self.attribute_map
    {
      :invoice_date => :invoice_date,
      :invoice_address => :invoice_address,
      :buyer_tax_number_valid => :buyer_tax_number_valid,
      :manual => :manual,
      :buyer_credit_card_prefix => :buyer_credit_card_prefix,
      :custom_fields => :custom_fields,
      :additional_currencies => :additional_currencies,
      :buyer_tax_number => :buyer_tax_number,
      :custom_id => :custom_id,
      :deducted_tax_amount => :deducted_tax_amount,
      :tax_country_code => :tax_country_code,
      :force_country_code => :force_country_code,
      :tax_amount => :tax_amount,
      :tax_timezone => :tax_timezone,
      :buyer_email => :buyer_email,
      :original_transaction_key => :original_transaction_key,
      :test => :test,
      :status => :status,
      :create_timestamp => :create_timestamp,
      :total_amount => :total_amount,
      :tax_entity_name => :tax_entity_name,
      :buyer_ip => :buyer_ip,
      :refunded_tax_amount => :refunded_tax_amount,
      :countries => :countries,
      :invoice_place => :invoice_place,
      :verification_token => :verification_token,
      :tax_deducted => :tax_deducted,
      :buyer_name => :buyer_name,
      :confirm_timestamp => :confirm_timestamp,
      :evidence => :evidence,
      :amount => :amount,
      :custom_data => :custom_data,
      :billing_country_code => :billing_country_code,
      :tax_supported => :tax_supported,
      :invoice_number => :invoice_number,
      :currency_code => :currency_code,
      :refunded_total_amount => :refunded_total_amount,
      :description => :description,
      :supply_date => :supply_date,
      :transaction_lines => :transaction_lines,
      :order_date => :order_date,
      :key => :key

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
    if attributes["buyer_tax_number_valid"]
      @buyer_tax_number_valid = attributes["buyer_tax_number_valid"]
        
    end
    if attributes["manual"]
      @manual = attributes["manual"]
        
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
    if attributes["deducted_tax_amount"]
      @deducted_tax_amount = attributes["deducted_tax_amount"]
        
    end
    if attributes["tax_country_code"]
      @tax_country_code = attributes["tax_country_code"]
        
    end
    if attributes["force_country_code"]
      @force_country_code = attributes["force_country_code"]
        
    end
    if attributes["tax_amount"]
      @tax_amount = attributes["tax_amount"]
        
    end
    if attributes["tax_timezone"]
      @tax_timezone = attributes["tax_timezone"]
        
    end
    if attributes["buyer_email"]
      @buyer_email = attributes["buyer_email"]
        
    end
    if attributes["original_transaction_key"]
      @original_transaction_key = attributes["original_transaction_key"]
        
    end
    if attributes["test"]
      @test = attributes["test"]
        
    end
    if attributes["status"]
      @status = attributes["status"]
        
    end
    if attributes["create_timestamp"]
      @create_timestamp = attributes["create_timestamp"]
        
    end
    if attributes["total_amount"]
      @total_amount = attributes["total_amount"]
        
    end
    if attributes["tax_entity_name"]
      @tax_entity_name = attributes["tax_entity_name"]
        
    end
    if attributes["buyer_ip"]
      @buyer_ip = attributes["buyer_ip"]
        
    end
    if attributes["refunded_tax_amount"]
      @refunded_tax_amount = attributes["refunded_tax_amount"]
        
    end
    if attributes["countries"]
      @countries = Countries.new(attributes["countries"])
        
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
    if attributes["confirm_timestamp"]
      @confirm_timestamp = attributes["confirm_timestamp"]
        
    end
    if attributes["evidence"]
      @evidence = Evidence.new(attributes["evidence"])
        
    end
    if attributes["amount"]
      @amount = attributes["amount"]
        
    end
    if attributes["custom_data"]
      @custom_data = attributes["custom_data"]
        
    end
    if attributes["billing_country_code"]
      @billing_country_code = attributes["billing_country_code"]
        
    end
    if attributes["tax_supported"]
      @tax_supported = attributes["tax_supported"]
        
    end
    if attributes["invoice_number"]
      @invoice_number = attributes["invoice_number"]
        
    end
    if attributes["currency_code"]
      @currency_code = attributes["currency_code"]
        
    end
    if attributes["refunded_total_amount"]
      @refunded_total_amount = attributes["refunded_total_amount"]
        
    end
    if attributes["description"]
      @description = attributes["description"]
        
    end
    if attributes["supply_date"]
      @supply_date = attributes["supply_date"]
        
    end
    if attributes["transaction_lines"]
      if (value = attributes["transaction_lines"]).is_a?(Array)
          @transaction_lines = value.map{ |v| TransactionLines.new(v) }
        end
      end
    if attributes["order_date"]
      @order_date = attributes["order_date"]
        
    end
    if attributes["key"]
      @key = attributes["key"]
        
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


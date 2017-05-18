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
class Transactions
  attr_accessor :confirm_timestamp, :fully_informative, :deducted_tax_amount, :order_date_type, :buyer_credit_card_prefix, :custom_data, :buyer_name, :invoice_date, :create_timestamp, :currency_code, :sub_account_id, :supply_date, :invoice_image_url, :key, :tax_number_service, :invoice_address, :buyer_tax_number_valid, :verification_token, :note, :tax_supported, :tax_data, :transaction_lines, :buyer_tax_number, :external_key, :status, :custom_fields, :force_country_code, :countries, :invoice_number, :order_date, :customer_id, :kind, :source, :amount, :comments, :buyer_ip, :buyer_email, :original_transaction_key, :billing_country_code, :custom_id, :tax_amount, :additional_currencies, :invoice_place, :total_amount, :tax_entity_name, :evidence, :refunded_tax_amount, :manual, :tax_timezone, :description, :test, :tax_deducted, :tax_country_code, :refunded_total_amount

  # :internal => :external
  def self.attribute_map
    {
      :confirm_timestamp => :confirm_timestamp,
      :fully_informative => :fully_informative,
      :deducted_tax_amount => :deducted_tax_amount,
      :order_date_type => :order_date_type,
      :buyer_credit_card_prefix => :buyer_credit_card_prefix,
      :custom_data => :custom_data,
      :buyer_name => :buyer_name,
      :invoice_date => :invoice_date,
      :create_timestamp => :create_timestamp,
      :currency_code => :currency_code,
      :sub_account_id => :sub_account_id,
      :supply_date => :supply_date,
      :invoice_image_url => :invoice_image_url,
      :key => :key,
      :tax_number_service => :tax_number_service,
      :invoice_address => :invoice_address,
      :buyer_tax_number_valid => :buyer_tax_number_valid,
      :verification_token => :verification_token,
      :note => :note,
      :tax_supported => :tax_supported,
      :tax_data => :tax_data,
      :transaction_lines => :transaction_lines,
      :buyer_tax_number => :buyer_tax_number,
      :external_key => :external_key,
      :status => :status,
      :custom_fields => :custom_fields,
      :force_country_code => :force_country_code,
      :countries => :countries,
      :invoice_number => :invoice_number,
      :order_date => :order_date,
      :customer_id => :customer_id,
      :kind => :kind,
      :source => :source,
      :amount => :amount,
      :comments => :comments,
      :buyer_ip => :buyer_ip,
      :buyer_email => :buyer_email,
      :original_transaction_key => :original_transaction_key,
      :billing_country_code => :billing_country_code,
      :custom_id => :custom_id,
      :tax_amount => :tax_amount,
      :additional_currencies => :additional_currencies,
      :invoice_place => :invoice_place,
      :total_amount => :total_amount,
      :tax_entity_name => :tax_entity_name,
      :evidence => :evidence,
      :refunded_tax_amount => :refunded_tax_amount,
      :manual => :manual,
      :tax_timezone => :tax_timezone,
      :description => :description,
      :test => :test,
      :tax_deducted => :tax_deducted,
      :tax_country_code => :tax_country_code,
      :refunded_total_amount => :refunded_total_amount

    }
  end

  def initialize(attributes = {})
    return if attributes.empty?
    # Morph attribute keys into undescored rubyish style
    unless attributes["confirm_timestamp"].nil?
      @confirm_timestamp = attributes["confirm_timestamp"]
        
    end
    unless attributes["fully_informative"].nil?
      @fully_informative = attributes["fully_informative"]
        
    end
    unless attributes["deducted_tax_amount"].nil?
      @deducted_tax_amount = attributes["deducted_tax_amount"]
        
    end
    unless attributes["order_date_type"].nil?
      @order_date_type = attributes["order_date_type"]
        
    end
    unless attributes["buyer_credit_card_prefix"].nil?
      @buyer_credit_card_prefix = attributes["buyer_credit_card_prefix"]
        
    end
    unless attributes["custom_data"].nil?
      @custom_data = attributes["custom_data"]
        
    end
    unless attributes["buyer_name"].nil?
      @buyer_name = attributes["buyer_name"]
        
    end
    unless attributes["invoice_date"].nil?
      @invoice_date = attributes["invoice_date"]
        
    end
    unless attributes["create_timestamp"].nil?
      @create_timestamp = attributes["create_timestamp"]
        
    end
    unless attributes["currency_code"].nil?
      @currency_code = attributes["currency_code"]
        
    end
    unless attributes["sub_account_id"].nil?
      @sub_account_id = attributes["sub_account_id"]
        
    end
    unless attributes["supply_date"].nil?
      @supply_date = attributes["supply_date"]
        
    end
    unless attributes["invoice_image_url"].nil?
      @invoice_image_url = attributes["invoice_image_url"]
        
    end
    unless attributes["key"].nil?
      @key = attributes["key"]
        
    end
    unless attributes["tax_number_service"].nil?
      @tax_number_service = attributes["tax_number_service"]
        
    end
    unless attributes["invoice_address"].nil?
      @invoice_address = InvoiceAddress.new(attributes["invoice_address"])
        
    end
    unless attributes["buyer_tax_number_valid"].nil?
      @buyer_tax_number_valid = attributes["buyer_tax_number_valid"]
        
    end
    unless attributes["verification_token"].nil?
      @verification_token = attributes["verification_token"]
        
    end
    unless attributes["note"].nil?
      @note = attributes["note"]
        
    end
    unless attributes["tax_supported"].nil?
      @tax_supported = attributes["tax_supported"]
        
    end
    unless attributes["tax_data"].nil?
      @tax_data = TaxDataSchema.new(attributes["tax_data"])
        
    end
    unless attributes["transaction_lines"].nil?
      if (value = attributes["transaction_lines"]).is_a?(Array)
          @transaction_lines = value.map{ |v| TransactionLines.new(v) }
        end
      end
    unless attributes["buyer_tax_number"].nil?
      @buyer_tax_number = attributes["buyer_tax_number"]
        
    end
    unless attributes["external_key"].nil?
      @external_key = attributes["external_key"]
        
    end
    unless attributes["status"].nil?
      @status = attributes["status"]
        
    end
    unless attributes["custom_fields"].nil?
      if (value = attributes["custom_fields"]).is_a?(Array)
          @custom_fields = value.map{ |v| CustomFields.new(v) }
        end
      end
    unless attributes["force_country_code"].nil?
      @force_country_code = attributes["force_country_code"]
        
    end
    unless attributes["countries"].nil?
      @countries = Countries.new(attributes["countries"])
        
    end
    unless attributes["invoice_number"].nil?
      @invoice_number = attributes["invoice_number"]
        
    end
    unless attributes["order_date"].nil?
      @order_date = attributes["order_date"]
        
    end
    unless attributes["customer_id"].nil?
      @customer_id = attributes["customer_id"]
        
    end
    unless attributes["kind"].nil?
      @kind = attributes["kind"]
        
    end
    unless attributes["source"].nil?
      @source = attributes["source"]
        
    end
    unless attributes["amount"].nil?
      @amount = attributes["amount"]
        
    end
    unless attributes["comments"].nil?
      @comments = attributes["comments"]
        
    end
    unless attributes["buyer_ip"].nil?
      @buyer_ip = attributes["buyer_ip"]
        
    end
    unless attributes["buyer_email"].nil?
      @buyer_email = attributes["buyer_email"]
        
    end
    unless attributes["original_transaction_key"].nil?
      @original_transaction_key = attributes["original_transaction_key"]
        
    end
    unless attributes["billing_country_code"].nil?
      @billing_country_code = attributes["billing_country_code"]
        
    end
    unless attributes["custom_id"].nil?
      @custom_id = attributes["custom_id"]
        
    end
    unless attributes["tax_amount"].nil?
      @tax_amount = attributes["tax_amount"]
        
    end
    unless attributes["additional_currencies"].nil?
      @additional_currencies = AdditionalCurrencies.new(attributes["additional_currencies"])
        
    end
    unless attributes["invoice_place"].nil?
      @invoice_place = attributes["invoice_place"]
        
    end
    unless attributes["total_amount"].nil?
      @total_amount = attributes["total_amount"]
        
    end
    unless attributes["tax_entity_name"].nil?
      @tax_entity_name = attributes["tax_entity_name"]
        
    end
    unless attributes["evidence"].nil?
      @evidence = Evidence.new(attributes["evidence"])
        
    end
    unless attributes["refunded_tax_amount"].nil?
      @refunded_tax_amount = attributes["refunded_tax_amount"]
        
    end
    unless attributes["manual"].nil?
      @manual = attributes["manual"]
        
    end
    unless attributes["tax_timezone"].nil?
      @tax_timezone = attributes["tax_timezone"]
        
    end
    unless attributes["description"].nil?
      @description = attributes["description"]
        
    end
    unless attributes["test"].nil?
      @test = attributes["test"]
        
    end
    unless attributes["tax_deducted"].nil?
      @tax_deducted = attributes["tax_deducted"]
        
    end
    unless attributes["tax_country_code"].nil?
      @tax_country_code = attributes["tax_country_code"]
        
    end
    unless attributes["refunded_total_amount"].nil?
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

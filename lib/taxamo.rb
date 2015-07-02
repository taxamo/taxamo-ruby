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

require "uri"
require "swagger"
require "taxamo/version"
require "require_all"
require_all "lib/taxamo/models/*"

module Taxamo
  class <<self
    def escapeString(string)
      URI.encode(string.to_s)
    end

    def create_refund (key,body,opts={})
      query_param_keys = []

      # verify existence of params
      raise "key is required" if key.nil?
      raise "body is required" if body.nil?
      # set default values and merge with input
      options = {
          :key => key,
          :body => body}.merge(opts)

      #resource path
      path = "/api/v1/transactions/{key}/refunds".sub('{format}','json').sub('{' + 'key' + '}', escapeString(key))


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      if body != nil
        if body.is_a?(Array)
          array = Array.new
          body.each do |item|
            if item.respond_to?("to_body".to_sym)
              array.push item.to_body
            else
              array.push item
            end
          end
          post_body = array

        else
          if body.respond_to?("to_body".to_sym)
            post_body = body.to_body
          else
            post_body = body
          end
        end
      end
      response = Swagger::Request.new(:POST, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      CreateRefundOut.new(response)

    end

    def create_payment (key,body,opts={})
      query_param_keys = []

      # verify existence of params
      raise "key is required" if key.nil?
      raise "body is required" if body.nil?
      # set default values and merge with input
      options = {
          :key => key,
          :body => body}.merge(opts)

      #resource path
      path = "/api/v1/transactions/{key}/payments".sub('{format}','json').sub('{' + 'key' + '}', escapeString(key))


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      if body != nil
        if body.is_a?(Array)
          array = Array.new
          body.each do |item|
            if item.respond_to?("to_body".to_sym)
              array.push item.to_body
            else
              array.push item
            end
          end
          post_body = array

        else
          if body.respond_to?("to_body".to_sym)
            post_body = body.to_body
          else
            post_body = body
          end
        end
      end
      response = Swagger::Request.new(:POST, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      CreatePaymentOut.new(response)

    end

    def list_payments (limit,offset,key,opts={})
      query_param_keys = [:limit,:offset]

      # verify existence of params
      raise "key is required" if key.nil?
      # set default values and merge with input
      options = {
          :limit => limit,
          :offset => offset,
          :key => key}.merge(opts)

      #resource path
      path = "/api/v1/transactions/{key}/payments".sub('{format}','json').sub('{' + 'key' + '}', escapeString(key))


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      ListPaymentsOut.new(response)

    end

    def capture_payment (key,opts={})
      query_param_keys = []

      # verify existence of params
      raise "key is required" if key.nil?
      # set default values and merge with input
      options = {
          :key => key}.merge(opts)

      #resource path
      path = "/api/v1/transactions/{key}/payments/capture".sub('{format}','json').sub('{' + 'key' + '}', escapeString(key))


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:POST, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      CapturePaymentOut.new(response)

    end

    def email_invoice (key,body,opts={})
      query_param_keys = []

      # verify existence of params
      raise "key is required" if key.nil?
      raise "body is required" if body.nil?
      # set default values and merge with input
      options = {
          :key => key,
          :body => body}.merge(opts)

      #resource path
      path = "/api/v1/transactions/{key}/invoice/send_email".sub('{format}','json').sub('{' + 'key' + '}', escapeString(key))


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      if body != nil
        if body.is_a?(Array)
          array = Array.new
          body.each do |item|
            if item.respond_to?("to_body".to_sym)
              array.push item.to_body
            else
              array.push item
            end
          end
          post_body = array

        else
          if body.respond_to?("to_body".to_sym)
            post_body = body.to_body
          else
            post_body = body
          end
        end
      end
      response = Swagger::Request.new(:POST, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      EmailInvoiceOut.new(response)

    end

    def create_transaction (body,opts={})
      query_param_keys = []

      # verify existence of params
      raise "body is required" if body.nil?
      # set default values and merge with input
      options = {
          :body => body}.merge(opts)

      #resource path
      path = "/api/v1/transactions".sub('{format}','json')


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      if body != nil
        if body.is_a?(Array)
          array = Array.new
          body.each do |item|
            if item.respond_to?("to_body".to_sym)
              array.push item.to_body
            else
              array.push item
            end
          end
          post_body = array

        else
          if body.respond_to?("to_body".to_sym)
            post_body = body.to_body
          else
            post_body = body
          end
        end
      end
      response = Swagger::Request.new(:POST, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      CreateTransactionOut.new(response)

    end

    def get_transaction (key,opts={})
      query_param_keys = []

      # verify existence of params
      raise "key is required" if key.nil?
      # set default values and merge with input
      options = {
          :key => key}.merge(opts)

      #resource path
      path = "/api/v1/transactions/{key}".sub('{format}','json').sub('{' + 'key' + '}', escapeString(key))


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      GetTransactionOut.new(response)

    end

    def update_transaction (key,body,opts={})
      query_param_keys = []

      # verify existence of params
      raise "key is required" if key.nil?
      raise "body is required" if body.nil?
      # set default values and merge with input
      options = {
          :key => key,
          :body => body}.merge(opts)

      #resource path
      path = "/api/v1/transactions/{key}".sub('{format}','json').sub('{' + 'key' + '}', escapeString(key))


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      if body != nil
        if body.is_a?(Array)
          array = Array.new
          body.each do |item|
            if item.respond_to?("to_body".to_sym)
              array.push item.to_body
            else
              array.push item
            end
          end
          post_body = array

        else
          if body.respond_to?("to_body".to_sym)
            post_body = body.to_body
          else
            post_body = body
          end
        end
      end
      response = Swagger::Request.new(:PUT, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      UpdateTransactionOut.new(response)

    end

    def confirm_transaction (key,body,opts={})
      query_param_keys = []

      # verify existence of params
      raise "key is required" if key.nil?
      raise "body is required" if body.nil?
      # set default values and merge with input
      options = {
          :key => key,
          :body => body}.merge(opts)

      #resource path
      path = "/api/v1/transactions/{key}/confirm".sub('{format}','json').sub('{' + 'key' + '}', escapeString(key))


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      if body != nil
        if body.is_a?(Array)
          array = Array.new
          body.each do |item|
            if item.respond_to?("to_body".to_sym)
              array.push item.to_body
            else
              array.push item
            end
          end
          post_body = array

        else
          if body.respond_to?("to_body".to_sym)
            post_body = body.to_body
          else
            post_body = body
          end
        end
      end
      response = Swagger::Request.new(:POST, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      ConfirmTransactionOut.new(response)

    end

    def cancel_transaction (key,opts={})
      query_param_keys = []

      # verify existence of params
      raise "key is required" if key.nil?
      # set default values and merge with input
      options = {
          :key => key}.merge(opts)

      #resource path
      path = "/api/v1/transactions/{key}".sub('{format}','json').sub('{' + 'key' + '}', escapeString(key))


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:DELETE, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      CancelTransactionOut.new(response)

    end

    def unconfirm_transaction (key,body,opts={})
      query_param_keys = []

      # verify existence of params
      raise "key is required" if key.nil?
      raise "body is required" if body.nil?
      # set default values and merge with input
      options = {
          :key => key,
          :body => body}.merge(opts)

      #resource path
      path = "/api/v1/transactions/{key}/unconfirm".sub('{format}','json').sub('{' + 'key' + '}', escapeString(key))


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      if body != nil
        if body.is_a?(Array)
          array = Array.new
          body.each do |item|
            if item.respond_to?("to_body".to_sym)
              array.push item.to_body
            else
              array.push item
            end
          end
          post_body = array

        else
          if body.respond_to?("to_body".to_sym)
            post_body = body.to_body
          else
            post_body = body
          end
        end
      end
      response = Swagger::Request.new(:POST, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      UnconfirmTransactionOut.new(response)

    end

    def list_transactions (statuses,sort_reverse,tax_country_code,order_date_from,key_or_custom_id,offset,filter_text,format,invoice_number,order_date_to,currency_code,limit,opts={})
      query_param_keys = [:statuses,:sort_reverse,:tax_country_code,:order_date_from,:key_or_custom_id,:offset,:filter_text,:format,:invoice_number,:order_date_to,:currency_code,:limit]

      # set default values and merge with input
      options = {
          :filter_text => filter_text,
          :offset => offset,
          :key_or_custom_id => key_or_custom_id,
          :currency_code => currency_code,
          :order_date_to => order_date_to,
          :sort_reverse => sort_reverse,
          :limit => limit,
          :invoice_number => invoice_number,
          :statuses => statuses,
          :order_date_from => order_date_from,
          :format => format,
          :tax_country_code => tax_country_code}.merge(opts)

      #resource path
      path = "/api/v1/transactions".sub('{format}','json')


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      ListTransactionsOut.new(response)

    end

    def calculate_tax (body,opts={})
      query_param_keys = []

      # verify existence of params
      raise "body is required" if body.nil?
      # set default values and merge with input
      options = {
          :body => body}.merge(opts)

      #resource path
      path = "/api/v1/tax/calculate".sub('{format}','json')


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      if body != nil
        if body.is_a?(Array)
          array = Array.new
          body.each do |item|
            if item.respond_to?("to_body".to_sym)
              array.push item.to_body
            else
              array.push item
            end
          end
          post_body = array

        else
          if body.respond_to?("to_body".to_sym)
            post_body = body.to_body
          else
            post_body = body
          end
        end
      end
      response = Swagger::Request.new(:POST, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      CalculateTaxOut.new(response)

    end

    def calculate_simple_tax (buyer_credit_card_prefix,buyer_tax_number,product_type,force_country_code,quantity,unit_price,total_amount,tax_deducted,amount,billing_country_code,currency_code,order_date,opts={})
      query_param_keys = [:buyer_credit_card_prefix,:buyer_tax_number,:product_type,:force_country_code,:quantity,:unit_price,:total_amount,:tax_deducted,:amount,:billing_country_code,:currency_code,:order_date]

      # verify existence of params
      raise "currency_code is required" if currency_code.nil?
      # set default values and merge with input
      options = {
          :product_type => product_type,
          :buyer_credit_card_prefix => buyer_credit_card_prefix,
          :currency_code => currency_code,
          :unit_price => unit_price,
          :quantity => quantity,
          :buyer_tax_number => buyer_tax_number,
          :force_country_code => force_country_code,
          :order_date => order_date,
          :amount => amount,
          :billing_country_code => billing_country_code,
          :total_amount => total_amount,
          :tax_deducted => tax_deducted}.merge(opts)

      #resource path
      path = "/api/v1/tax/calculate".sub('{format}','json')


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      CalculateSimpleTaxOut.new(response)

    end

    def validate_tax_number (country_code,tax_number,opts={})
      query_param_keys = [:country_code]

      # verify existence of params
      raise "tax_number is required" if tax_number.nil?
      # set default values and merge with input
      options = {
          :country_code => country_code,
          :tax_number => tax_number}.merge(opts)

      #resource path
      path = "/api/v1/tax/vat_numbers/{tax_number}/validate".sub('{format}','json').sub('{' + 'tax_number' + '}', escapeString(tax_number))


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      ValidateTaxNumberOut.new(response)

    end

    def calculate_tax_location (billing_country_code,buyer_credit_card_prefix,opts={})
      query_param_keys = [:billing_country_code,:buyer_credit_card_prefix]

      # set default values and merge with input
      options = {
          :billing_country_code => billing_country_code,
          :buyer_credit_card_prefix => buyer_credit_card_prefix}.merge(opts)

      #resource path
      path = "/api/v1/tax/location/calculate".sub('{format}','json')


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      CalculateTaxLocationOut.new(response)

    end

    def locate_my_i_p (opts={})
      query_param_keys = []

      # set default values and merge with input
      options = {
          }.merge(opts)

      #resource path
      path = "/api/v1/geoip".sub('{format}','json')


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      LocateMyIPOut.new(response)

    end

    def locate_given_i_p (ip,opts={})
      query_param_keys = []

      # verify existence of params
      raise "ip is required" if ip.nil?
      # set default values and merge with input
      options = {
          :ip => ip}.merge(opts)

      #resource path
      path = "/api/v1/geoip/{ip}".sub('{format}','json').sub('{' + 'ip' + '}', escapeString(ip))


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      LocateGivenIPOut.new(response)

    end

    def get_transactions_stats (date_from,date_to,interval,opts={})
      query_param_keys = [:date_from,:date_to,:interval]

      # verify existence of params
      raise "date_from is required" if date_from.nil?
      raise "date_to is required" if date_to.nil?
      # set default values and merge with input
      options = {
          :date_from => date_from,
          :date_to => date_to,
          :interval => interval}.merge(opts)

      #resource path
      path = "/api/v1/stats/transactions".sub('{format}','json')


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      GetTransactionsStatsOut.new(response)

    end

    def get_settlement_stats_by_country (date_from,date_to,opts={})
      query_param_keys = [:date_from,:date_to]

      # verify existence of params
      raise "date_from is required" if date_from.nil?
      raise "date_to is required" if date_to.nil?
      # set default values and merge with input
      options = {
          :date_from => date_from,
          :date_to => date_to}.merge(opts)

      #resource path
      path = "/api/v1/stats/settlement/by_country".sub('{format}','json')


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      GetSettlementStatsByCountryOut.new(response)

    end

    def get_settlement_stats_by_taxation_type (date_from,date_to,opts={})
      query_param_keys = [:date_from,:date_to]

      # verify existence of params
      raise "date_from is required" if date_from.nil?
      raise "date_to is required" if date_to.nil?
      # set default values and merge with input
      options = {
          :date_from => date_from,
          :date_to => date_to}.merge(opts)

      #resource path
      path = "/api/v1/stats/settlement/by_taxation_type".sub('{format}','json')


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      GetSettlementStatsByTaxationTypeOut.new(response)

    end

    def get_daily_settlement_stats (interval,date_from,date_to,opts={})
      query_param_keys = [:interval,:date_from,:date_to]

      # verify existence of params
      raise "interval is required" if interval.nil?
      raise "date_from is required" if date_from.nil?
      raise "date_to is required" if date_to.nil?
      # set default values and merge with input
      options = {
          :interval => interval,
          :date_from => date_from,
          :date_to => date_to}.merge(opts)

      #resource path
      path = "/api/v1/stats/settlement/daily".sub('{format}','json')


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      GetDailySettlementStatsOut.new(response)

    end

    def get_refunds (format,moss_country_code,date_from,opts={})
      query_param_keys = [:format,:moss_country_code,:date_from]

      # verify existence of params
      raise "date_from is required" if date_from.nil?
      # set default values and merge with input
      options = {
          :format => format,
          :moss_country_code => moss_country_code,
          :date_from => date_from}.merge(opts)

      #resource path
      path = "/api/v1/settlement/refunds".sub('{format}','json')


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      GetRefundsOut.new(response)

    end

    def get_settlement (format,moss_country_code,moss_tax_id,quarter,opts={})
      query_param_keys = [:format,:moss_country_code,:moss_tax_id]

      # verify existence of params
      raise "quarter is required" if quarter.nil?
      # set default values and merge with input
      options = {
          :format => format,
          :moss_country_code => moss_country_code,
          :moss_tax_id => moss_tax_id,
          :quarter => quarter}.merge(opts)

      #resource path
      path = "/api/v1/settlement/{quarter}".sub('{format}','json').sub('{' + 'quarter' + '}', escapeString(quarter))


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      GetSettlementOut.new(response)

    end

    def get_settlement_summary (moss_country_code,quarter,opts={})
      query_param_keys = [:moss_country_code]

      # verify existence of params
      raise "quarter is required" if quarter.nil?
      # set default values and merge with input
      options = {
          :moss_country_code => moss_country_code,
          :quarter => quarter}.merge(opts)

      #resource path
      path = "/api/v1/settlement/summary/{quarter}".sub('{format}','json').sub('{' + 'quarter' + '}', escapeString(quarter))


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      GetSettlementSummaryOut.new(response)

    end

    def create_s_m_s_token (body,opts={})
      query_param_keys = []

      # verify existence of params
      raise "body is required" if body.nil?
      # set default values and merge with input
      options = {
          :body => body}.merge(opts)

      #resource path
      path = "/api/v1/verification/sms".sub('{format}','json')


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      if body != nil
        if body.is_a?(Array)
          array = Array.new
          body.each do |item|
            if item.respond_to?("to_body".to_sym)
              array.push item.to_body
            else
              array.push item
            end
          end
          post_body = array

        else
          if body.respond_to?("to_body".to_sym)
            post_body = body.to_body
          else
            post_body = body
          end
        end
      end
      response = Swagger::Request.new(:POST, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      CreateSMSTokenOut.new(response)

    end

    def verify_s_m_s_token (token,opts={})
      query_param_keys = []

      # verify existence of params
      raise "token is required" if token.nil?
      # set default values and merge with input
      options = {
          :token => token}.merge(opts)

      #resource path
      path = "/api/v1/verification/sms/{token}".sub('{format}','json').sub('{' + 'token' + '}', escapeString(token))


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      VerifySMSTokenOut.new(response)

    end

    def get_currencies_dict (opts={})
      query_param_keys = []

      # set default values and merge with input
      options = {
          }.merge(opts)

      #resource path
      path = "/api/v1/dictionaries/currencies".sub('{format}','json')


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      GetCurrenciesDictOut.new(response)

    end

    def get_product_types_dict (opts={})
      query_param_keys = []

      # set default values and merge with input
      options = {
          }.merge(opts)

      #resource path
      path = "/api/v1/dictionaries/product_types".sub('{format}','json')


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      GetProductTypesDictOut.new(response)

    end

    def get_countries_dict (tax_supported,opts={})
      query_param_keys = [:tax_supported]

      # set default values and merge with input
      options = {
          :tax_supported => tax_supported}.merge(opts)

      #resource path
      path = "/api/v1/dictionaries/countries".sub('{format}','json')


      # pull querystring keys from options
      queryopts = options.select do |key,value|
        query_param_keys.include? key
      end

      headers = nil
      post_body = nil
      response = Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body }).make.body
      GetCountriesDictOut.new(response)

    end

    end
    end

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

class CalculateTaxLocationOut
  attr_accessor :tax_country_code, :tax_deducted, :tax_supported, :countries, :buyer_ip, :billing_country_code, :buyer_credit_card_prefix, :evidence

  # :internal => :external
  def self.attribute_map
    {
      :tax_country_code => :tax_country_code,
      :tax_deducted => :tax_deducted,
      :tax_supported => :tax_supported,
      :countries => :countries,
      :buyer_ip => :buyer_ip,
      :billing_country_code => :billing_country_code,
      :buyer_credit_card_prefix => :buyer_credit_card_prefix,
      :evidence => :evidence

    }
  end

  def initialize(attributes = {})
    return if attributes.empty?
    # Morph attribute keys into undescored rubyish style
    if attributes["tax_country_code"]
      @tax_country_code = attributes["tax_country_code"]
        
    end
    if attributes["tax_deducted"]
      @tax_deducted = attributes["tax_deducted"]
        
    end
    if attributes["tax_supported"]
      @tax_supported = attributes["tax_supported"]
        
    end
    if attributes["countries"]
      @countries = Countries.new(attributes["countries"])
        
    end
    if attributes["buyer_ip"]
      @buyer_ip = attributes["buyer_ip"]
        
    end
    if attributes["billing_country_code"]
      @billing_country_code = attributes["billing_country_code"]
        
    end
    if attributes["buyer_credit_card_prefix"]
      @buyer_credit_card_prefix = attributes["buyer_credit_card_prefix"]
        
    end
    if attributes["evidence"]
      @evidence = Evidence.new(attributes["evidence"])
        
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


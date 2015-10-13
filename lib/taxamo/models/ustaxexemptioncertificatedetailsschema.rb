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

class UsTaxExemptionCertificateDetailsSchema
  attr_accessor :single_purchase_order_identifier, :purchaser_business_type, :purchaser_exemption_reason_value, :purchaser_state, :purchaser_zip, :purchaser_city, :purchaser_last_name, :purchaser_exemption_reason, :single_purchase, :purchaser_tax_id, :purchaser_address2, :purchaser_address1, :purchaser_business_type_other_value, :purchaser_first_name, :exempt_states, :purchaser_title

  # :internal => :external
  def self.attribute_map
    {
      :single_purchase_order_identifier => :single_purchase_order_identifier,
      :purchaser_business_type => :purchaser_business_type,
      :purchaser_exemption_reason_value => :purchaser_exemption_reason_value,
      :purchaser_state => :purchaser_state,
      :purchaser_zip => :purchaser_zip,
      :purchaser_city => :purchaser_city,
      :purchaser_last_name => :purchaser_last_name,
      :purchaser_exemption_reason => :purchaser_exemption_reason,
      :single_purchase => :single_purchase,
      :purchaser_tax_id => :purchaser_tax_id,
      :purchaser_address2 => :purchaser_address2,
      :purchaser_address1 => :purchaser_address1,
      :purchaser_business_type_other_value => :purchaser_business_type_other_value,
      :purchaser_first_name => :purchaser_first_name,
      :exempt_states => :exempt_states,
      :purchaser_title => :purchaser_title

    }
  end

  def initialize(attributes = {})
    return if attributes.empty?
    # Morph attribute keys into undescored rubyish style
    if attributes["single_purchase_order_identifier"]
      @single_purchase_order_identifier = attributes["single_purchase_order_identifier"]
        
    end
    if attributes["purchaser_business_type"]
      @purchaser_business_type = attributes["purchaser_business_type"]
        
    end
    if attributes["purchaser_exemption_reason_value"]
      @purchaser_exemption_reason_value = attributes["purchaser_exemption_reason_value"]
        
    end
    if attributes["purchaser_state"]
      @purchaser_state = attributes["purchaser_state"]
        
    end
    if attributes["purchaser_zip"]
      @purchaser_zip = attributes["purchaser_zip"]
        
    end
    if attributes["purchaser_city"]
      @purchaser_city = attributes["purchaser_city"]
        
    end
    if attributes["purchaser_last_name"]
      @purchaser_last_name = attributes["purchaser_last_name"]
        
    end
    if attributes["purchaser_exemption_reason"]
      @purchaser_exemption_reason = attributes["purchaser_exemption_reason"]
        
    end
    if attributes["single_purchase"]
      @single_purchase = attributes["single_purchase"]
        
    end
    if attributes["purchaser_tax_id"]
      @purchaser_tax_id = UsTaxId.new(attributes["purchaser_tax_id"])
        
    end
    if attributes["purchaser_address2"]
      @purchaser_address2 = attributes["purchaser_address2"]
        
    end
    if attributes["purchaser_address1"]
      @purchaser_address1 = attributes["purchaser_address1"]
        
    end
    if attributes["purchaser_business_type_other_value"]
      @purchaser_business_type_other_value = attributes["purchaser_business_type_other_value"]
        
    end
    if attributes["purchaser_first_name"]
      @purchaser_first_name = attributes["purchaser_first_name"]
        
    end
    if attributes["exempt_states"]
      if (value = attributes["exempt_states"]).is_a?(Array)
          @exempt_states = value.map{ |v| UsTaxExemptState.new(v) }
        end
      end
    if attributes["purchaser_title"]
      @purchaser_title = attributes["purchaser_title"]
        
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


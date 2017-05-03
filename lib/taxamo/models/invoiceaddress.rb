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
class InvoiceAddress
  attr_accessor :freeform_address, :building_number, :street_name, :address_detail, :city, :postal_code, :region, :country

  # :internal => :external
  def self.attribute_map
    {
      :freeform_address => :freeform_address,
      :building_number => :building_number,
      :street_name => :street_name,
      :address_detail => :address_detail,
      :city => :city,
      :postal_code => :postal_code,
      :region => :region,
      :country => :country

    }
  end

  def initialize(attributes = {})
    return if attributes.empty?
    # Morph attribute keys into undescored rubyish style
    if attributes["freeform_address"]
      @freeform_address = attributes["freeform_address"]
        
    end
    if attributes["building_number"]
      @building_number = attributes["building_number"]
        
    end
    if attributes["street_name"]
      @street_name = attributes["street_name"]
        
    end
    if attributes["address_detail"]
      @address_detail = attributes["address_detail"]
        
    end
    if attributes["city"]
      @city = attributes["city"]
        
    end
    if attributes["postal_code"]
      @postal_code = attributes["postal_code"]
        
    end
    if attributes["region"]
      @region = attributes["region"]
        
    end
    if attributes["country"]
      @country = attributes["country"]
        
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

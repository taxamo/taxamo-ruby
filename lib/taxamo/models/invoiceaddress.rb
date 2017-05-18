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
    unless attributes["freeform_address"].nil?
      @freeform_address = attributes["freeform_address"]
        
    end
    unless attributes["building_number"].nil?
      @building_number = attributes["building_number"]
        
    end
    unless attributes["street_name"].nil?
      @street_name = attributes["street_name"]
        
    end
    unless attributes["address_detail"].nil?
      @address_detail = attributes["address_detail"]
        
    end
    unless attributes["city"].nil?
      @city = attributes["city"]
        
    end
    unless attributes["postal_code"].nil?
      @postal_code = attributes["postal_code"]
        
    end
    unless attributes["region"].nil?
      @region = attributes["region"]
        
    end
    unless attributes["country"].nil?
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

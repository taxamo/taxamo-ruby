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
class Country
  attr_accessor :code_long, :codenum, :currency, :tax_supported, :name, :ccn3, :tax_region, :cca3, :calling_code, :tax_number_country_code, :code, :cca2

  # :internal => :external
  def self.attribute_map
    {
      :code_long => :code_long,
      :codenum => :codenum,
      :currency => :currency,
      :tax_supported => :tax_supported,
      :name => :name,
      :ccn3 => :ccn3,
      :tax_region => :tax_region,
      :cca3 => :cca3,
      :calling_code => :callingCode,
      :tax_number_country_code => :tax_number_country_code,
      :code => :code,
      :cca2 => :cca2

    }
  end

  def initialize(attributes = {})
    return if attributes.empty?
    # Morph attribute keys into undescored rubyish style
    if attributes["code_long"]
      @code_long = attributes["code_long"]
        
    end
    if attributes["codenum"]
      @codenum = attributes["codenum"]
        
    end
    if attributes["currency"]
      if (value = attributes["currency"]).is_a?(Array)
          @currency = value
        end
      end
    if attributes["tax_supported"]
      @tax_supported = attributes["tax_supported"]
        
    end
    if attributes["name"]
      @name = attributes["name"]
        
    end
    if attributes["ccn3"]
      @ccn3 = attributes["ccn3"]
        
    end
    if attributes["tax_region"]
      @tax_region = attributes["tax_region"]
        
    end
    if attributes["cca3"]
      @cca3 = attributes["cca3"]
        
    end
    if attributes["calling_code"]
      if (value = attributes["callingCode"]).is_a?(Array)
          @calling_code = value
        end
      end
    if attributes["tax_number_country_code"]
      @tax_number_country_code = attributes["tax_number_country_code"]
        
    end
    if attributes["code"]
      @code = attributes["code"]
        
    end
    if attributes["cca2"]
      @cca2 = attributes["cca2"]
        
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

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
class ByTaxationType
  attr_accessor :taxed_count, :deducted_count, :transactions_count, :eu_b2b, :eu_taxed

  # :internal => :external
  def self.attribute_map
    {
      :taxed_count => :taxed_count,
      :deducted_count => :deducted_count,
      :transactions_count => :transactions_count,
      :eu_b2b => :eu_b2b,
      :eu_taxed => :eu_taxed

    }
  end

  def initialize(attributes = {})
    return if attributes.empty?
    # Morph attribute keys into undescored rubyish style
    unless attributes["taxed_count"].nil?
      @taxed_count = attributes["taxed_count"]
        
    end
    unless attributes["deducted_count"].nil?
      @deducted_count = attributes["deducted_count"]
        
    end
    unless attributes["transactions_count"].nil?
      @transactions_count = attributes["transactions_count"]
        
    end
    unless attributes["eu_b2b"].nil?
      @eu_b2b = attributes["eu_b2b"]
        
    end
    unless attributes["eu_taxed"].nil?
      @eu_taxed = attributes["eu_taxed"]
        
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

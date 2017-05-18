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
class SettlementDailyStatsSchema
  attr_accessor :b2c, :untaxed, :eu_taxed, :eu_b2b, :count, :eu_total, :day_raw, :b2b, :day

  # :internal => :external
  def self.attribute_map
    {
      :b2c => :b2c,
      :untaxed => :untaxed,
      :eu_taxed => :eu_taxed,
      :eu_b2b => :eu_b2b,
      :count => :count,
      :eu_total => :eu_total,
      :day_raw => :day_raw,
      :b2b => :b2b,
      :day => :day

    }
  end

  def initialize(attributes = {})
    return if attributes.empty?
    # Morph attribute keys into undescored rubyish style
    unless attributes["b2c"].nil?
      @b2c = attributes["b2c"]
        
    end
    unless attributes["untaxed"].nil?
      @untaxed = attributes["untaxed"]
        
    end
    unless attributes["eu_taxed"].nil?
      @eu_taxed = attributes["eu_taxed"]
        
    end
    unless attributes["eu_b2b"].nil?
      @eu_b2b = attributes["eu_b2b"]
        
    end
    unless attributes["count"].nil?
      @count = attributes["count"]
        
    end
    unless attributes["eu_total"].nil?
      @eu_total = attributes["eu_total"]
        
    end
    unless attributes["day_raw"].nil?
      @day_raw = attributes["day_raw"]
        
    end
    unless attributes["b2b"].nil?
      @b2b = attributes["b2b"]
        
    end
    unless attributes["day"].nil?
      @day = attributes["day"]
        
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

# Copyright 2014 Taxamo, Ltd.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class EvidenceSchema
  attr_accessor :used, :resolved_country_code, :evidence_type, :evidence_value

  # :internal => :external
  def self.attribute_map
    {
      :used => :used,
      :resolved_country_code => :resolved_country_code,
      :evidence_type => :evidence_type,
      :evidence_value => :evidence_value

    }
  end

  def initialize(attributes = {})
    return if attributes.empty?
    # Morph attribute keys into undescored rubyish style
    if attributes["used"]
      @used = attributes["used"]
        
    end
    if attributes["resolved_country_code"]
      @resolved_country_code = attributes["resolved_country_code"]
        
    end
    if attributes["evidence_type"]
      @evidence_type = attributes["evidence_type"]
        
    end
    if attributes["evidence_value"]
      @evidence_value = attributes["evidence_value"]
        
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


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
class UsTaxExemptState
  attr_accessor :state_abbr, :reason_for_exemption, :identifier_for_exemption_reason

  # :internal => :external
  def self.attribute_map
    {
      :state_abbr => :state_abbr,
      :reason_for_exemption => :reason_for_exemption,
      :identifier_for_exemption_reason => :identifier_for_exemption_reason

    }
  end

  def initialize(attributes = {})
    return if attributes.empty?
    # Morph attribute keys into undescored rubyish style
    unless attributes["state_abbr"].nil?
      @state_abbr = attributes["state_abbr"]
        
    end
    unless attributes["reason_for_exemption"].nil?
      @reason_for_exemption = attributes["reason_for_exemption"]
        
    end
    unless attributes["identifier_for_exemption_reason"].nil?
      @identifier_for_exemption_reason = attributes["identifier_for_exemption_reason"]
        
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

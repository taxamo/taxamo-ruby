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
class CurrencySchema
  attr_accessor :code, :minorunits, :description, :isocode, :isonum

  # :internal => :external
  def self.attribute_map
    {
      :code => :code,
      :minorunits => :minorunits,
      :description => :description,
      :isocode => :isocode,
      :isonum => :isonum

    }
  end

  def initialize(attributes = {})
    return if attributes.nil? or attributes.empty?
    # Morph attribute keys into undescored rubyish style
    if attributes.key?("code")
      @code = attributes["code"]
        
    end
    if attributes.key?("minorunits")
      @minorunits = attributes["minorunits"]
        
    end
    if attributes.key?("description")
      @description = attributes["description"]
        
    end
    if attributes.key?("isocode")
      @isocode = attributes["isocode"]
        
    end
    if attributes.key?("isonum")
      @isonum = attributes["isonum"]
        
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

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
class Evidence
  attr_accessor :by_token, :by_cc, :by_2003_rules, :forced, :by_payment_method, :by_ip, :guessed_from_ip, :other_commercially_relevant_info, :by_billing, :by_tax_number, :self_declaration

  # :internal => :external
  def self.attribute_map
    {
      :by_token => :by_token,
      :by_cc => :by_cc,
      :by_2003_rules => :by_2003_rules,
      :forced => :forced,
      :by_payment_method => :by_payment_method,
      :by_ip => :by_ip,
      :guessed_from_ip => :guessed_from_ip,
      :other_commercially_relevant_info => :other_commercially_relevant_info,
      :by_billing => :by_billing,
      :by_tax_number => :by_tax_number,
      :self_declaration => :self_declaration

    }
  end

  def initialize(attributes = {})
    return if attributes.nil? or attributes.empty?
    # Morph attribute keys into undescored rubyish style
    if attributes.key?("by_token")
      @by_token = EvidenceSchema.new(attributes["by_token"])
        
    end
    if attributes.key?("by_cc")
      @by_cc = EvidenceSchema.new(attributes["by_cc"])
        
    end
    if attributes.key?("by_2003_rules")
      @by_2003_rules = EvidenceSchema.new(attributes["by_2003_rules"])
        
    end
    if attributes.key?("forced")
      @forced = EvidenceSchema.new(attributes["forced"])
        
    end
    if attributes.key?("by_payment_method")
      @by_payment_method = EvidenceSchema.new(attributes["by_payment_method"])
        
    end
    if attributes.key?("by_ip")
      @by_ip = EvidenceSchema.new(attributes["by_ip"])
        
    end
    if attributes.key?("guessed_from_ip")
      @guessed_from_ip = EvidenceSchema.new(attributes["guessed_from_ip"])
        
    end
    if attributes.key?("other_commercially_relevant_info")
      @other_commercially_relevant_info = EvidenceSchema.new(attributes["other_commercially_relevant_info"])
        
    end
    if attributes.key?("by_billing")
      @by_billing = EvidenceSchema.new(attributes["by_billing"])
        
    end
    if attributes.key?("by_tax_number")
      @by_tax_number = EvidenceSchema.new(attributes["by_tax_number"])
        
    end
    if attributes.key?("self_declaration")
      @self_declaration = EvidenceSchema.new(attributes["self_declaration"])
        
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

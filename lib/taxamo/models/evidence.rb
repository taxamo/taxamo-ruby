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

class Evidence
  attr_accessor :by_2003_rules, :by_payment_method, :by_tax_number, :self_declaration, :by_cc, :by_ip, :by_token, :by_billing, :guessed_from_ip, :other_commercially_relevant_info, :forced

  # :internal => :external
  def self.attribute_map
    {
      :by_2003_rules => :by_2003_rules,
      :by_payment_method => :by_payment_method,
      :by_tax_number => :by_tax_number,
      :self_declaration => :self_declaration,
      :by_cc => :by_cc,
      :by_ip => :by_ip,
      :by_token => :by_token,
      :by_billing => :by_billing,
      :guessed_from_ip => :guessed_from_ip,
      :other_commercially_relevant_info => :other_commercially_relevant_info,
      :forced => :forced

    }
  end

  def initialize(attributes = {})
    return if attributes.empty?
    # Morph attribute keys into undescored rubyish style
    if attributes["by_2003_rules"]
      @by_2003_rules = EvidenceSchema.new(attributes["by_2003_rules"])
        
    end
    if attributes["by_payment_method"]
      @by_payment_method = EvidenceSchema.new(attributes["by_payment_method"])
        
    end
    if attributes["by_tax_number"]
      @by_tax_number = EvidenceSchema.new(attributes["by_tax_number"])
        
    end
    if attributes["self_declaration"]
      @self_declaration = EvidenceSchema.new(attributes["self_declaration"])
        
    end
    if attributes["by_cc"]
      @by_cc = EvidenceSchema.new(attributes["by_cc"])
        
    end
    if attributes["by_ip"]
      @by_ip = EvidenceSchema.new(attributes["by_ip"])
        
    end
    if attributes["by_token"]
      @by_token = EvidenceSchema.new(attributes["by_token"])
        
    end
    if attributes["by_billing"]
      @by_billing = EvidenceSchema.new(attributes["by_billing"])
        
    end
    if attributes["guessed_from_ip"]
      @guessed_from_ip = EvidenceSchema.new(attributes["guessed_from_ip"])
        
    end
    if attributes["other_commercially_relevant_info"]
      @other_commercially_relevant_info = EvidenceSchema.new(attributes["other_commercially_relevant_info"])
        
    end
    if attributes["forced"]
      @forced = EvidenceSchema.new(attributes["forced"])
        
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


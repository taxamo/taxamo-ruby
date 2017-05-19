# Copyright 2014-2017 Taxamo, Ltd.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'test/unit'
require 'shoulda'
require 'taxamo'


class DictTest < Test::Unit::TestCase

  should 'return countries dictionaries with some attrs present ' do

    Swagger.configure do |config|
      config.api_key = 'SamplePrivateTestKey1'
    end
    resp = Taxamo.get_countries_dict(nil)

    assert_equal resp.dictionary[0].code, "00"
    assert_equal resp.dictionary[0].tax_region, nil
    assert_true resp.dictionary[0].instance_variable_defined?(:@tax_region)


  end



end

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

require 'test/unit'
require 'shoulda'
require 'taxamo'

class ConnectivityTest < Test::Unit::TestCase

  should 'test_validate' do
    Swagger.configure do |config|
      config.api_key = 'SamplePrivateTestKey1'
    end

    assert_raise(ValidationError) {
      Taxamo.calculate_tax ({'__transaction' => {
                               'currency_code' => 'USD',
                               'buyer_ip' => '127.0.0.1',
                               'billing_country_code' => 'IE',
                               'force_country_code' => 'FR',
                               'transaction_lines' => [{'amount' => 200,
                                                        'custom_id' => 'line1'},
                                                       {'amount' => 100,
                                                        'product_type' => 'e-book',
                                                        'custom_id' => 'line2'}]}}) }
  end

  should 'test_auth' do
    Swagger.configure do |config|
      config.api_key = 'SamplePrivateTestKey1'
    end
    assert_raise(AuthenticationError) {
      Taxamo.calculate_tax({'transaction' => {
                              'currency_code' => 'USD',
                              'buyer_ip' => '127.0.0.1',
                              'billing_country_code' => 'IE',
                              'force_country_code' => 'FR',
                              'transaction_lines' => [{'amount' => 200,
                                                       'custom_id' => 'line1'},
                                                      {'amount' => 100,
                                                       'product_type' => 'e-book',
                                                       'custom_id' => 'line2'}]}},
                                                       {:configuration => {:api_key => 'SamplePrivateTestKey1!'}})}
  end
end
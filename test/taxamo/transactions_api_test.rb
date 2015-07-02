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

class TransactionsApiTest < Test::Unit::TestCase

  should 'test_ops' do
    Swagger.configure do |config|
      config.api_key = 'SamplePrivateTestKey1'
    end

    resp = Taxamo.create_transaction(
        {
            'transaction' => {
                'currency_code' => 'USD',
                'buyer_ip' => '127.0.0.1',
                'billing_country_code' => 'IE',
                'force_country_code' => 'FR',
                'order_date' => '2014-06-01',
                'buyer_email' => 'test-ruby@taxamo.com',
                'transaction_lines' => [{'amount' => 200,
                                         'custom_id' => 'line1'},
                                        {'amount' => 100,
                                         'product_type' => 'e-book',
                                         'custom_id' => 'line2'}]
            }})
    assert_false resp.transaction.key.nil?
    assert_equal resp.transaction.countries.detected.code, 'IE'
    assert_equal resp.transaction.amount, 300
    assert_equal resp.transaction.tax_amount, 45.5
    assert_equal resp.transaction.total_amount, 345.5
    assert_equal resp.transaction.status, 'N'

    resp = Taxamo.get_transaction(resp.transaction.key)

    assert_false resp.transaction.key.nil?
    assert_equal resp.transaction.amount, 300
    assert_equal resp.transaction.tax_amount, 45.5
    assert_equal resp.transaction.total_amount, 345.5
    assert_equal resp.transaction.status, 'N'
    assert_equal resp.transaction.evidence.by_billing.resolved_country_code, 'IE'
    assert_equal resp.transaction.evidence.by_ip.resolved_country_code, 'IE'
    assert_equal resp.transaction.evidence.forced.resolved_country_code, 'FR'
    assert_equal resp.transaction.buyer_email, 'test-ruby@taxamo.com'


    resp = Taxamo.update_transaction(resp.transaction.key,
                                     {'transaction' =>
                                          {'buyer_name' => 'Ruby tester #2',
                                           'currency_code' => 'CHF',
                                           'invoice_address' => {'street_name' => 'Test street #4'},
                                           'transaction_lines' => [{'amount' => 30,
                                                                    'custom_id' => 'line1'},
                                                                   {'amount' => 40,
                                                                    'product_type' => 'e-book',
                                                                    'custom_id' => 'line2'}]}})

    assert_false resp.transaction.key.nil?

    assert_equal resp.transaction.status, 'N'
    assert_equal resp.transaction.amount, 70
    assert_equal resp.transaction.tax_amount, 8.2
    assert_equal resp.transaction.total_amount, 78.2

    resp = Taxamo.get_transaction(resp.transaction.key)

    assert_false resp.transaction.key.nil?
    assert_equal resp.transaction.buyer_name, 'Ruby tester #2'
    assert_equal resp.transaction.invoice_address.street_name, 'Test street #4'

    assert_equal resp.transaction.status, 'N'
    assert_equal resp.transaction.amount, 70
    assert_equal resp.transaction.tax_amount, 8.2
    assert_equal resp.transaction.total_amount, 78.2
    assert_equal resp.transaction.evidence.by_billing.resolved_country_code, 'IE'
    assert_equal resp.transaction.evidence.by_ip.resolved_country_code, 'IE'
    assert_equal resp.transaction.evidence.forced.resolved_country_code, 'FR'

    resp = Taxamo.confirm_transaction(resp.transaction.key,
                                      {'transaction' =>
                                           {'buyer_name' => 'Ruby tester',
                                            'invoice_place' => 'Rubytown',
                                            'currency_code' => 'EUR',
                                            'transaction_lines' => [{'amount' => 300,
                                                                     'custom_id' => 'line1'},
                                                                    {'amount' => 400,
                                                                     'product_type' => 'e-book',
                                                                     'custom_id' => 'line2'}]}})

    assert_false resp.transaction.key.nil?
    assert_equal resp.transaction.status, 'C'
    assert_equal resp.transaction.amount, 700
    assert_equal resp.transaction.tax_amount, 82
    assert_equal resp.transaction.total_amount, 782

    resp = Taxamo.get_transaction(resp.transaction.key)

    assert_false resp.transaction.key.nil?
    assert_equal resp.transaction.status, 'C'
    assert_equal resp.transaction.amount, 700
    assert_equal resp.transaction.tax_amount, 82
    assert_equal resp.transaction.total_amount, 782
    assert_equal resp.transaction.evidence.by_billing.resolved_country_code, 'IE'
    assert_equal resp.transaction.evidence.by_ip.resolved_country_code, 'IE'
    assert_equal resp.transaction.evidence.forced.resolved_country_code, 'FR'

    #statuses,sort_reverse,tax_country_code,order_date_from,offset,filter_text,format,order_date_to,currency_code,limit
    resp = Taxamo.list_transactions('C', #statuses
                                    'true', #sort_reverse
                                    nil, #tax_country_code
                                    '2014-01-01', #order_date_from
                                    nil, #key_or_custom_id
                                    nil, #filter_text
                                    0, #offset
                                    nil, #format,
                                    nil,#invoice_number
                                    '2099-12-31', #order_date_to,
                                    'EUR', #currency_code,
                                    100)

    assert_true resp.transactions.length > 0
    assert_true resp.transactions.length <= 100

    resp.transactions.each do |transaction|
      assert_equal transaction.status, 'C'
      assert_equal transaction.currency_code, 'EUR'
    end
    resp = Taxamo.list_transactions('N', #statuses
                                    'true', #sort_reverse
                                    nil, #tax_country_code
                                    '2099-12-01', #order_date_from
                                    nil, #key_or_custom_id
                                    nil, #filter_text
                                    0, #offset
                                    nil, #format,
                                    nil, #invoice_number
                                    '2099-12-31', #order_date_to,
                                    'EUR', #currency_code,
                                    10)
    assert_true resp.transactions.length == 0

  end

  should "cancel test" do
    Swagger.configure do |config|
      config.api_key = 'SamplePrivateTestKey1'
    end
    resp = Taxamo.create_transaction(
        {'transaction' => {
            'currency_code' => 'USD',
            'buyer_ip' => '127.0.0.1',
            'billing_country_code' => 'IE',
            'force_country_code' => 'FR',
            'transaction_lines' => [{'amount' => 200,
                                     'custom_id' => 'line1'},
                                    {'amount' => 100,
                                     'product_type' => 'e-book',
                                     'custom_id' => 'line2'}]
        }})
    assert_false resp.transaction.key.nil?
    assert_equal resp.transaction.status, 'N'

    resp = Taxamo.cancel_transaction(resp.transaction.key)

    assert_true resp.success
  end

  should 'evidence fields test' do

    Swagger.configure do |config|
      config.api_key = 'SamplePrivateTestKey1'
    end

    resp = Taxamo.create_transaction(
        {'transaction' => {
            'currency_code' => 'USD',
            'evidence' => {
                'other_commercially_relevant_info' => {'evidence_value' => 'GR'},
                'self_declaration' => {'evidence_value' => 'GR'}
            },
            'billing_country_code' => 'GR',
            'order_date' => '2014-06-01',
            'buyer_email' => 'test-Ruby@taxamo.com',
            'transaction_lines' => [{'amount' => 200,
                                     'custom_id' => 'line1'},
                                    {'amount' => 100,
                                     'product_type' => 'e-book',
                                     'custom_id' => 'line2'}]
        }})
    assert_false resp.transaction.key.nil?
    assert_equal resp.transaction.countries.detected.code, 'GR'
    assert_equal resp.transaction.countries.other_commercially_relevant_info.code, 'GR'
    assert_equal resp.transaction.countries.self_declaration.code, 'GR'
    assert_equal resp.transaction.status, 'N'

    resp = Taxamo.get_transaction(resp.transaction.key)

    assert_false resp.transaction.key.nil?
    assert_equal resp.transaction.status, 'N'
    assert_equal resp.transaction.evidence.by_billing.resolved_country_code, 'GR'
    assert_equal resp.transaction.evidence.other_commercially_relevant_info.resolved_country_code, 'GR'
    assert_equal resp.transaction.evidence.self_declaration.resolved_country_code, 'GR'

  end

  should "test custom fields" do
    resp = Taxamo.create_transaction(
        {'transaction' => {
            'currency_code' => 'USD',
            'buyer_ip' => '127.0.0.1',
            'billing_country_code' => 'IE',
            'force_country_code' => 'FR',
            'order_date' => '2014-06-01',
            'custom_fields' => [{'key' => 'test1', 'value' => 'test2'},
                                {'key' => 'test1', 'value' => 'test3'}],
            'transaction_lines' => [{'amount' => 200,
                                     'custom_id' => 'line1',
                                     'custom_fields' => [{'key' => 'test11', 'value' => 'test22'},
                                                         {'key' => 'test41', 'value' => 'test23'}]},
                                    {'amount' => 100,
                                     'product_type' => 'e-book',
                                     'custom_id' => 'line2'}]
        }})

    assert_false resp.transaction.key.nil?
    assert_equal resp.transaction.status, 'N'
    assert_equal resp.transaction.custom_fields[0].key, 'test1'
    assert_equal resp.transaction.custom_fields[1].value, 'test3'

    resp = Taxamo.get_transaction(resp.transaction.key)

    assert_false resp.transaction.key.nil?
    assert_equal resp.transaction.status, 'N'
    assert_equal resp.transaction.custom_fields[0].key, 'test1'
    assert_equal resp.transaction.custom_fields[1].value, 'test3'
    assert_equal resp.transaction.transaction_lines[0].custom_fields[1].value, 'test23'

    resp = Taxamo.update_transaction(resp.transaction.key,
                                    {'transaction' =>
                                         {'buyer_name' => 'Ruby tester #2',
                                          'currency_code' => 'CHF',
                                          'invoice_address' => {'street_name' => 'Test street #4'},
                                          'custom_fields' => [{'key' => 'test51', 'value' => 'test52'},
                                                              {'key' => 'test51', 'value' => 'test53'},
                                                              {'key' => 'test61', 'value' => 'test63'}],
                                          'transaction_lines' => [{'amount' => 30,
                                                                   'custom_id' => 'line1',
                                                                   'custom_fields' => [{'key' => 'test11', 'value' => 'test22'},
                                                                                       {'key' => 'test41', 'value' => 'test43'}]},
                                                                  {'amount' => 40,
                                                                   'product_type' => 'e-book',
                                                                   'custom_id' => 'line2',
                                                                   'custom_fields' => [{'key' => 'test21', 'value' => 'test82'},
                                                                                       {'key' => 'test71', 'value' => 'test83'}]}]}})

    assert_false resp.transaction.key.nil?




    resp = Taxamo.get_transaction(resp.transaction.key)

    assert_false resp.transaction.key.nil?
    assert_equal resp.transaction.status, 'N'
    assert_equal resp.transaction.custom_fields[0].key, 'test51'
    assert_equal resp.transaction.custom_fields[1].value, 'test53'
    assert_equal resp.transaction.custom_fields[2].value, 'test63'
    assert_equal resp.transaction.transaction_lines[0].custom_fields[1].value, 'test43'
    assert_equal resp.transaction.transaction_lines[1].custom_fields[1].value, 'test83'

    assert_raise(ValidationError) { Taxamo.capture_payment(resp.transaction.key)}

    resp = Taxamo.list_transactions('N', #statuses
                                    'true', #sort_reverse
                                    nil, #tax_country_code
                                    '2001-12-01', #order_date_from
                                    nil, #key_or_custom_id
                                    0, #offset
                                    nil, #filter_text
                                    nil, #format,
                                    nil, #invoice_number
                                    '2099-12-31', #order_date_to,
                                    'CHF', #currency_code,
                                    10)

    assert_false resp.transactions[0].key.nil?
    assert_equal resp.transactions[0].status, 'N'
    assert_equal resp.transactions[0].custom_fields[0].key, 'test51'
    assert_equal resp.transactions[0].custom_fields[1].value, 'test53'
    assert_equal resp.transactions[0].custom_fields[2].value, 'test63'
    assert_equal resp.transactions[0].transaction_lines[0].custom_fields[1].value, 'test43'
    assert_equal resp.transactions[0].transaction_lines[1].custom_fields[1].value, 'test83'

  end

end
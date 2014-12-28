

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
      config.api_key = 'SamplePrivateTestKey1!'
    end
    assert_raise(AuthenticationError) {
      Taxamo.calculate_tax ({'__transaction' => {
                               'currency_code' => 'USD',
                               'buyer_ip' => '127.0.0.1',
                               'billing_country_code' => 'IE',
                               'force_country_code' => 'FR',
                               'transaction_lines' => [{'amount' => 200,
                                                        'custom_id' => 'line1'},
                                                       {'amount' => 100,
                                                        'product_type' => 'e-book',
                                                        'custom_id' => 'line2'}]}})}


  end
end
require 'test/unit'
require 'shoulda'
require 'taxamo'


class TaxTest < Test::Unit::TestCase

  should 'basic tax calculation works' do

    Swagger.configure do |config|
      config.api_key = 'SamplePrivateTestKey1'
    end
    resp = Taxamo.calculate_tax(
        {'transaction' => {
            'currency_code' => 'USD',
            'buyer_ip' => '127.0.0.1',
            'billing_country_code' => 'IE',
            'force_country_code' => 'FR',
            'transaction_lines' => [{'amount' => 200,
                                     'custom_id' => 'line1'},
                                    {'amount' => 100,
                                     'product_type' => 'e-book',
                                     'custom_id' => 'line2'}]}})

    assert_equal resp.transaction.countries.detected.code, 'IE'
    assert_equal resp.transaction.amount, 300
    assert_equal resp.transaction.tax_amount, 45.5
    assert_equal resp.transaction.total_amount, 345.5

    assert_equal resp.transaction.transaction_lines[0].custom_id, 'line1'
    assert_equal resp.transaction.transaction_lines[0].tax_rate, 20
    assert_equal resp.transaction.transaction_lines[0].tax_amount, 40
    assert_equal resp.transaction.transaction_lines[1].custom_id, 'line2'
    assert_equal resp.transaction.transaction_lines[1].tax_rate, 5.5
    assert_equal resp.transaction.transaction_lines[1].tax_amount, 5.5
  end


  should 'data model works' do

    Swagger.configure do |config|
      config.api_key = 'SamplePrivateTestKey1'
    end

    taxIn = CalculateTaxIn.new
    taxIn.transaction = InputTransaction.new
    taxIn.transaction.currency_code = 'USD'
    taxIn.transaction.buyer_ip = '127.0.0.1'
    taxIn.transaction.billing_country_code = 'IE'
    taxIn.transaction.force_country_code = 'FR'
    taxIn.transaction.transaction_lines = [InputTransactionLine.new, InputTransactionLine.new]
    taxIn.transaction.transaction_lines[0].amount = 200
    taxIn.transaction.transaction_lines[0].custom_id = 'line1'
    taxIn.transaction.transaction_lines[1].amount = 100
    taxIn.transaction.transaction_lines[1].custom_id = 'line2'
    taxIn.transaction.transaction_lines[1].product_type = 'e-book'

    resp = Taxamo.calculate_tax(taxIn)

    assert_equal resp.transaction.countries.detected.code, 'IE'
    assert_equal resp.transaction.amount, 300
    assert_equal resp.transaction.tax_amount, 45.5
    assert_equal resp.transaction.total_amount, 345.5

    assert_equal resp.transaction.transaction_lines[0].custom_id, 'line1'
    assert_equal resp.transaction.transaction_lines[0].tax_rate, 20
    assert_equal resp.transaction.transaction_lines[0].tax_amount, 40
    assert_equal resp.transaction.transaction_lines[1].custom_id, 'line2'
    assert_equal resp.transaction.transaction_lines[1].tax_rate, 5.5
    assert_equal resp.transaction.transaction_lines[1].tax_amount, 5.5
  end

  should 'test simple calculate' do

    Swagger.configure do |config|
      config.api_key = 'SamplePrivateTestKey1'
    end
    resp = Taxamo.calculate_simple_tax(nil,
                                       nil,
                                       'e-book', #product_type
                                       'FR', #force_country_code
                                       nil,
                                       nil,
                                       nil,
                                       nil,
                                       100, #amount
                                       'IE', #billing_country_code
                                       'USD', #currency_code
                                       nil)

    assert_equal resp.transaction.tax_country_code, 'FR'
    assert_equal resp.transaction.amount, 100
    assert_equal resp.transaction.tax_amount, 5.5
    assert_equal resp.transaction.total_amount, 105.5

    assert_equal resp.transaction.transaction_lines[0].tax_rate, 5.5
    assert_equal resp.transaction.transaction_lines[0].tax_rate, 5.5
    assert_equal resp.transaction.transaction_lines[0].total_amount, 105.5

  end

  should 'test validate tax number' do

    Swagger.configure do |config|
      config.api_key = 'SamplePrivateTestKey1'
    end
    resp = Taxamo.validate_tax_number(nil, 'IE6388047V')
    assert_equal resp.tax_deducted, true
    assert_equal resp.billing_country_code, 'IE'

    resp = Taxamo.validate_tax_number('IE', '6388047V')
    assert_equal resp.tax_deducted, true
    assert_equal resp.billing_country_code, 'IE'

    resp = Taxamo.validate_tax_number('IE', '6388047V12121')

    assert_equal resp.tax_deducted, nil
  end


  should 'test_location_calculate' do

    Swagger.configure do |config|
      config.api_key = 'SamplePrivateTestKey1'
    end

    resp = Taxamo.calculate_tax_location('BE', '424242')
    assert_equal resp.tax_country_code, 'BE'
    assert_equal resp.tax_supported, true
    assert_equal resp.countries.detected.code, 'BE'
    assert_equal resp.countries.by_billing.code, 'BE'
    assert_equal resp.countries.by_cc.code, 'BE'

  end
end

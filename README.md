# Taxamo API Ruby client

This package provides [Taxamo](http://www.taxamo.com) API bindings for Ruby and was generated using Swagger-codegen.

## Installation

To install it, just fetch this repository and issue the following command:

```shell
$ gem build taxamo.gemspec
$ gem install taxamo-1.0.3.gem
```

Alternatively, add the following line to your project's `Gemfile` file:

```ruby
gem "taxamo", github: "taxamo/taxamo-ruby"
```

## Changes

1.0.3 (2015-04-15):
 * use require_rel to make the require work properly when using bundler to manage the dependencies 
 
1.0.2 (2015-03-16):
 * Refresh CreateRefundOut with new field and updated documentation 
 
1.0.1:
 
 * Added buyer_tax_number_valid field to tax calculation, transaction storage and VAT number validation operations
 * Added key_or_custom_id to list_transactions operation - please note, that the number of arguments has changed!

## Usage

First of all, you need to set your private test or live token:

```ruby
require 'taxamo'

Swagger.configure do |config|
  config.api_key = 'YOUR_TOKEN_HERE'
end
```

Next, you can invoke the API as functions in Taxamo module:

```ruby
resp = Taxamo.get_transaction('SOME_TRANSACTION_ID')
```

It is possible to use hashes and arrays as input:

```ruby
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
```

But also regular classes:

```ruby
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
```

The output is always coerced to appropriate classes:

```ruby
assert_equal resp.transaction.countries.detected.code, 'IE'
assert_equal resp.transaction.amount, 300
assert_equal resp.transaction.tax_amount, 45.5
assert_equal resp.transaction.total_amount, 345.5
```

See the regression tests for more examples.

## Documentation

Please see http://www.taxamo.com/documentation/ for the most up-to-date documentation.

## License

Copyright 2014-2015 Taxamo, Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

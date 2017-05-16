# Taxamo API Ruby client

This package provides [Taxamo](http://www.taxamo.com) API bindings for Ruby and was generated using Swagger-codegen.

## Installation

Taxamo Ruby client is available on RubyGems [https://rubygems.org/gems/taxamo-ns](https://rubygems.org/gems/taxamo-ns), either with Gemfile:

```
gem 'taxamo-ns', '~> 2'
```

or with `gem install`:

```
gem install taxamo-ns
```

The library can also be installed directy - just fetch this repository and issue the following command:

```shell
$ gem build taxamo.gemspec
$ gem install taxamo-ns-2.2.0.gem
```

Finally, you can use this github repo and add the following line to your project's `Gemfile` file:

```ruby
gem "taxamo-ns", github: "taxamo/taxamo-ruby", '~> 2'
```

If your code relies on 1.x version and uses the classes for constructing input, without the namespaces, you can keep on using it:

```ruby
gem "taxamo", github: "taxamo/taxamo-ruby", '~> 1.1'
```

## Changes

2.2.0 (2017-05-03):
 * rename the gem to taxamo-ns to distinguish it from non-namespaced version
 
2.1.0 (2017-05-03):
 * bring API client up-to-date with current api endpoints. Please note that the following methods have their arity changed: `get_eu_vies_report`, `get_settlement`, `list_transactions`.
 
2.0.1 (2016-05-23):
 * bring dependencies up-to-date

2.0.0 (2016-05-20):
 * introduce namespaces to taxamo.models.*
 * send a Source-Id header in all HTTP requests. The header will contain current library version.

1.1.1 (2016-05-17):
 * bring API client up-to-date with current api endpoints. Please note that the following methods have their arity changed: `list_transactions`

1.1.0 (2015-10-13):
 * update API client with multiple region support. Please note that the following methods have their arity changed: 
`list_transactions`, `calculate_simple_tax`, `get_refunds`, `get_settlement`, `get_settlement_summary` 
 
1.0.6.1 (2015-07-20):
 * fix for rubygems.org publishing issue  
 
1.0.6 (2015-07-20):
 * fix regression with require_rel

1.0.5 (2015-07-02):
 * sync with the newest API model, including addition of getsettlementdailystats operation
 
1.0.4 (2015-04-15):
 * sync with the newest API data model, including unconfirm transaction and email invoice operations and a default currency code for each country
 * please note, that the list_transactions operation has new argument: invoice_number, changing the argument count to 12

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
taxIn = Taxamo::CalculateTaxIn.new
taxIn.transaction = Taxamo::InputTransaction.new
taxIn.transaction.currency_code = 'USD'
taxIn.transaction.buyer_ip = '127.0.0.1'
taxIn.transaction.billing_country_code = 'IE'
taxIn.transaction.force_country_code = 'FR'
taxIn.transaction.transaction_lines = [Taxamo::InputTransactionLine.new, Taxamo::InputTransactionLine.new]
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

Copyright 2014-2016 Taxamo, Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

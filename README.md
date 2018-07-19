[![Build Status](https://semaphoreci.com/api/v1/wowonrails/currency_scanner/branches/master/shields_badge.svg)](https://semaphoreci.com/wowonrails/currency_scanner)
[![Maintainability](https://api.codeclimate.com/v1/badges/f376a72c918fde193357/maintainability)](https://codeclimate.com/github/wowonrails/currency_scanner/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/f376a72c918fde193357/test_coverage)](https://codeclimate.com/github/wowonrails/currency_scanner/test_coverage)

# Currency Scanner

The application demonstrates the actual dollar exchange rate published on the website [CBR](https://www.cbr.ru/). The application administrator can forcibly change the rate using the input form. When you change rate, its value
automatically updated for all application clients.

## Quick Start

```bash
# clone repo
git clone git@github.com:wowonrails/currency_scanner.git
cd currency_scanner

# run setup script
bin/setup

# run server
bin/rails s
```

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - run brakeman and rails_best_practices for the app
* `bin/ci` - should be used in the CI to run specs

## Production

* https://currency_scanner.herokuapp.com/

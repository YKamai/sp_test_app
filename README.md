# Parser

Parser is a ruby application for parsing log files and counting the statistic of users' page visits. Calculated statistic is provided directly to console and contains the following:

* list of webpages with most page views ordered from most pages views to less page views
* list of webpages with most unique page views also ordered

## Installation

> NOTE: Ruby 3.0 or higher is required

Parser's installation is pretty standard:
* clone the repository:

  ```
  $ git clone https://github.com/YKamai/sp_test_app.git
  ```
* install required ruby gems:

  ```
  $ bundle install
  ```

## Run Parser

To run Parser app you only need to provide the path to the log file and then watch the magic happen.

```
$ bin/app path/to/file.log
```

The output result ordered descendingly by the number of visits/views will be show in you console as soon as the process is done, e.g.:

```
Ordered list of webpages with most page views:
/about 81 visits
/home 78 visits
...
Ordered list of webpages with most unique page views:
/home 21 unique views
/contact 10 unique views
...
```

## Log Files

Parser expects standart logging files with extension `.log`.
Each visit/view record has to be placed on a new line in the file and contain at least the page identifier (name, path or url) and the visitor identifier (e.g. IP address) separated by space.

An example of the log file content:
```
/home 682.704.613.213
/help_page/1 836.973.694.403
...
```

## Tests

Unit tests are written with RSpec and can be run as usual:
```
$ rspec
```

Test coverage report is generated after each tests run:
```
$ open coverage/index.html
```

## Code Quality

Application code is analysed by the following tools:
* [rubocop](https://github.com/rubocop/rubocop)
  ```
  $ rubocop
  ```
* [reek](https://github.com/troessner/reek)
  ```
  $ reek
  ```

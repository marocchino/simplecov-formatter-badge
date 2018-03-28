# Simplecov Badge Formatter

## Examples

![red](examples/red.svg)
![yellow](examples/yellow.svg)
![green](examples/green.svg)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simplecov-formatter-badge', require: false
```

And then execute:

    $ bundle

## Usage

```ruby
require 'simplecov-formatter-badge'
SimpleCov.formatter =
  SimpleCov::Formatter::MultiFormatter.new \
    [SimpleCov::Formatter::HTMLFormatter,
     SimpleCov::Formatter::BadgeFormatter]
```

then use it from your README

```md
[![coverage](https://path.to.report/coverage.svg)](https://path.to.report/)
```

## Why not ...

- simplecov-badge: not pretty
- simplecov-formatter-shield: bug & not fix it
- simplecov-shields-badge: do not want commit coverage

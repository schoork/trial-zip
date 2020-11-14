# Zipping Files

Uses the [RubyZip](https://github.com/rubyzip/rubyzip) gem.

## Installation

In the Gemfile:

```
gem 'rubyzip'
```

## Usage

1. Check lib/tasks/zip.rake for a basic zip of current files.
2. Check app/controllers/home_controller.rb (download) action for how to
   send the zip as data (link on app/views/home/index.html.erb).

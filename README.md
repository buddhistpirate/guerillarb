# Guerillarb
[![Build Status](https://travis-ci.org/buddhistpirate/guerillarb.png?branch=master)](https://travis-ci.org/buddhistpirate/guerillarb)
Guerillarb is a TCP service for serving random document bodies. You supply it an integer followed by a newline and it will serve you a JSON array of that many lines indexed randomly from a random source document. It will then select contiguous lines. If the document does not have enough lines it will chose another file to serve the remaining lines.

## Installation

Add this line to your application's Gemfile:

    gem 'guerillarb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guerillarb

## Usage

./guerilla -directory SourceDocumentFolder -port PortNumber
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

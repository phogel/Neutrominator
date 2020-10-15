# Neutrominator [![Build Status](https://travis-ci.org/phogel/Neutrominator.svg?branch=master)](https://travis-ci.org/phogel/Neutrominator)

A project to apply the power of regular expressions to linguistics.
Browser extension for Google Chrome that improves readability of German texts by removing neologistic pseudo-expressions invented to damage the free spirit, technically converting Leser\*innen to Leser or LeserInnen, dependant on user choice.

## Development

After checking out the repo, run `npm install` to install dependencies. Note this requires the node package manager installed on your machine.

### Sources

Core sources are found in `./src` and written in CoffeeScript. Auxiliary, plain JS files are kept in `/dist`.

#### Compiling

The command

    npm run compile

compiles the .coffee files and moves them into the dist folder. To upload to Google App store:

- increment the version number in `dist/manifest.json`
- zip the contents of the dist folder
- upload

#### Tests

Test files are found in `./tests` and can be executed by running

    npm test

### Common errors

Some of the scripts might assume that `webpack` is installed and available on the `$PATH`. In case it can't be found, either fix your `$PATH` setup to include the binaries from your `node_modules` folder (`nvm` usually does this for you) or install `webpack`:

    $ npm install -g webpack

## Contributing

Errors in conversion can be in the `Issues` tab, preferably the full unconverted sentence.

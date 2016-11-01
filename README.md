# Neutrominator

Browser extension for Google Chrome that improves readability of gendered expressions in the German language, i.e. converts Leser*innen to Leser or LeserInnen dependant on user choice.

## Development

After checking out the repo, run `npm install` to install dependencies. Note this requires the node package manager installed on your machine.

### Sources

Core sources are found in `./src` and written in CoffeeScript. Auxiliary, plain JS files are kept in `/dist`.

#### Compiling

The command

    npm run compile

compiles the .coffee files and moves them into the dist folder

#### Tests

Test files are found in `./tests` and can be executed 


### Common errors

Some of the scripts might assume that `webpack` is installed and available on the `$PATH`. In case it can't be found, either fix your `$PATH` setup to include the binaries from your `node_modules` folder (`nvm` usually does this for you) or install `webpack`:

    $ npm install -g webpack

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/phogel/neutrominator.


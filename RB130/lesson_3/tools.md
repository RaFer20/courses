# *Gems*
RubyGems, often just called Gems, are packages of code that you can download, install, and use in your Ruby programs or from the command line. The gem command manages your Gems; all versions of Ruby since version 1.9 supply gem as part of the standard installation.

gem examples:
- rubocop: This Gem checks for Ruby style guide violations and other potential issues in your code.
- pry: This Gem helps debug Ruby programs.
- sequel: This Gem provides a set of classes and methods that simplify database access.
- rails: This Gem provides a web application framework that simplifies and speeds web applications development.

The basics of Gems are pretty simple: you can search the RubyGems website to find a Gem you want to install, and then run gem install to install the Gem on your system. Once installed, you can start using most Gems immediately, though you may have to read the documentation first.


# *RVM* (or rbenv)

Ruby version managers let you manage multiple versions of Ruby, the utilities (such as irb) associated with each version, and the RubyGems installed for each Ruby. With version managers, you can install and uninstall ruby versions and gems, and run specific versions of ruby with specific programs and environments.

# *Bundler*

Bundler lets you describe exactly which Ruby and Gems you want to use with your Ruby apps. Specifically, it lets you install multiple versions of each Gem under a specific version of Ruby and then use the proper version in your app.

Bundler is a RubyGem, so you must install it like a normal Gem: gem install bundler.

Bundler uses the `Gemfile` to generate a `Gemfile.lock` file via the bundle install command. `Gemfile.lock` describes the actual versions of each Gem that your app needs, including any Gems that the Gems listed in `Gemfile` depend on. The bundler/setup package tells your Ruby program to use `Gemfile.lock` to determine which Gem versions it should load.

The bundle exec command ensures that executable programs installed by Gems don't interfere with your app's requirements.

# *Rake*

Rake is a Rubygem that automates many common functions required to build, test, package, and install programs; it is part of every modern Ruby installation, so you don't need to install it yourself.

Here are some common Rake tasks that you may encounter:

- Set up required environment by creating directories and files
- Set up and initialize databases
- Run tests
- Package your application and all of its files for distribution
- Install the application
- Perform common Git tasks
- Rebuild certain files and directories (assets) based on changes to other files and directories

Rake uses a file named `Rakefile` that lives in your project directory; this file describes the tasks that Rake can perform for your project, and how to perform those tasks.

Example `Rakefile`:

```ruby
desc 'Say hello'
task :hello do
  puts "Hello there. This is the `hello` task."
end

desc 'Say goodbye'
task :bye do
  puts 'Bye now!'
end

desc 'Do everything'
task :default => [:hello, :bye]
```

This Rakefile contains three tasks: two that simply display a single message, and one task that has the other tasks as prerequisites or dependencies. The first two tasks are named :hello and :bye, while the final task is the default task; Rake runs the default task if you do not provide a specific task name when you invoke Rake.

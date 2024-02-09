
Important details:

- Rubygems provide a library of code that you can download and run or use directly inside your Ruby programs. You use the gem command to manage the Gems you need.

- Rubygems also provide the mechanisms you need to release your own Gems, which can either be packages of code you require into your Ruby programs, or independent Ruby programs that you can run (eg, the bundle program from the Bundler gem).

- Ruby projects usually use the Rubygems format.

- Ruby Version Managers help you manage multiple versions of Ruby on a single system. Each Ruby version has its own set of tools such as the gem and bundle commands.

- Bundler provides the tools you need to describe the dependencies for your Ruby programs. This makes it easy to distribute your program to other systems: Bundler installs all the necessary components, and even ensures that the program uses the correct version of each Gem.

- Rake provides a way to easily manage and run repetitive tasks that a developer needs when working on a project.

- The .gemspec file provides information about a Gem. If you decide to release a program or library as a Gem, you must include a .gemspec file.

- If you run into problems, consult the Core Ruby Tools book.
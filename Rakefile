require 'rake'
require 'fileutils'

Dir.glob('install/*.rake').each { |r| import r }

class String
  def red; "\e[31m#{self}\e[0m" end
  def blue; "\e[34m#{self}\e[0m" end
  def gray; "\e[37m#{self}\e[0m" end
  def bold; "\e[1m#{self}\e[22m" end
end

class ProgressBar
  def initialize(total)
    @total = total
    @counter = 1
  end

  def progress(message = "")
    puts "#{"[#{@counter}/#{@total}]".gray} #{message.red}"
    @counter += 1
  end
end

task :install do
  puts "🔥 Welcome to @vadikace dotfiles\n".blue.bold

  tasks = {
    "brew:install" => "🍺 Installing Homebrew...",
    "brew:install_packages" => "📦 Installing Homebrew packages...",
    "brew:install_casks" => "📦 Installing Homebrew casks...",
    "pygments:install" => "🐍 Installing Pygments...",
    "thoughtbot:install" => "🤔 Installing thoughtbot dotfiles...",
  }

  progress_bar = ProgressBar.new(tasks.size)

  tasks.each do |task, message|
    progress_bar.progress(message)
    Rake::Task[task].invoke
  end
end

task "thoughtbot:install" do
  unless Dir.exist?("#{ENV["HOME"]}/dotfiles")
    sh "git clone git://github.com/thoughtbot/dotfiles.git ~/dotfiles"
  end

  unless system("which rcup")
    sh "brew tap thoughtbot/formulae"
    sh "brew install rcm"
  end

  # Tweak files which shouldn't be symlinked
  excluded_files = [
    "install",
    "Rakefile",
    # If git_template folder is symlinked then all the hooks between all
    # projects will become symlinked, which is for sure not desired.
    "git_template",
    "TODO"
  ].join(' ');

  sh "gsed -i.bak -E \"s/^(EXCLUDES.*)\\\"$/\\1 #{excluded_files}\\\"/\" ~/dotfiles/rcrc"
  sh "env RCRC=$HOME/dotfiles/rcrc rcup"
  sh "cp -r $HOME/dotfiles/git_template $HOME/.git_template"
end

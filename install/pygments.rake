namespace :pygments do
  task :install do
    # Install pygmentize with the built-in python
    unless system('which pygmentize')
      sh "sudo easy_install Pygments"
    end
  end
end

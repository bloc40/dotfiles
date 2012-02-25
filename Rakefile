require 'rake'

desc 'Install the dot files into the home directory'
task :install do
  EXCLUDED_FILES = %w[ . .. .git Rakefile README.rdoc ]

  home_directory_files = []
  Dir.foreach(ENV['HOME']) { |f| home_directory_files << f }

  Dir.foreach(ENV['PWD']).each do |file|
    next if EXCLUDED_FILES.include?(file)

    if home_directory_files.include?(file)
      puts "Skipping ~/#{file}. It exists already"
    else
      puts "Linking ~/#{file}"
      system %Q{ln -s $PWD/#{file} $HOME/#{file}}
    end
  end
end

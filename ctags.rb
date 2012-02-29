gems  = `bundle show`.split(/\n\s+\*\s+/)
gems = gems.drop(1)
gems = gems.map {|g| g.gsub!(/ \(/, '-'); g.gsub!(/\)/, ''); g.gsub!(/\n/, ''); g}
path = `rvm gemset dir`.chomp
library_load_string = ''
gems.each do |gem|
  library_load_string += " -R #{path}/gems/#{gem}"
end
puts '1'*80
p gems
puts '2'*80
p library_load_string

`/usr/local/bin/ctags -f tags --exclude="*.js" --exclude="*.log" --langmap="ruby:+.rake.builder.rjs" -R . #{library_load_string}`
`sort tags`

#
# 'autotest' for riot
# install watchr
# $ sudo gem install watchr
#
# Run With:
# $ watchr test.watchr
#

# --------------------------------------------------
# Helpers
# --------------------------------------------------

def run(cmd)
  clear_screen
  puts(blue(cmd))
  system(cmd)
end

def blue(str)
  "\e[34m#{str}\e[0m"
end

def clear_screen
  print "\e[2J\e[f" if $stdout.isatty
end

def run_all_tests
  system( "padrino rake test" )
end

def sudo(cmd)
  run("sudo #{cmd}")
end

def test_file(m)
  File.join('test', m[0].sub('.rb', '_test.rb'))
end

# --------------------------------------------------
# Watchr Rules
# --------------------------------------------------
watch("^lib.*/(.*)\.rb") { |m| run("ruby -I test:lib #{test_file(m)}") }
watch("^app/(models)/(.*).rb") { |m| run("ruby -I test:lib #{test_file(m)}") }
watch("^app/(views)/(.*).haml") { |m| run("haml --check #{m[0]}") }
watch("test.*/test_config\.rb") { run_all_tests }
watch("^test/(.*)_test\.rb")  { |m| run("ruby -I test:lib #{m[0]}")}
watch("^spec/(.*)_spec\.rb")  { |m| run("rspec -f d --fail-fast -c -I spec:lib #{m[0]}")}

# watch("^app/views/(.*)/(.*).haml") { |m| run("ruby test/controllers/#{m[1]}_controller_test.rb")}

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
# Ctrl-\
Signal.trap('QUIT') do
  puts " --- Running all tests ---\n\n"
  run_all_tests
end

# Ctrl-C
Signal.trap('INT') { abort("\n") }


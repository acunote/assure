# Copyright (c) 2010-2013 Pluron, Inc.

#Use this to raise internal error with a given message.
#This works for all modes - production, development, etc.
def internal_error(message = 'internal error')
    raise message
end

#Raises internal error when expression evaluates to nil or false
#Use this to check various preconditions, for example
# def do_smth(x)
#   assure(x.is_a? String)
# end
#You can provide optional message to be printed in the exception output.
def assure(expression, message = nil)
    return if expression
    file, method, line = get_caller_location_for_assure

    #Try to find expression in assert
    expression = File.readlines(file)[line.to_i-1].
        gsub(/^.*assure\s*\(\s*/, '').gsub(/\s*\)\s*$/, '')

    #cleanup path - remove rails root and "./"
    if defined? Rails
        file = file.gsub(Rails.root.to_s+'/', '')
    else
        file = file.gsub(Dir.pwd, '')
    end
    file = file.gsub(/^\.\//, '') 
    raise internal_error("#{file}:#{line}: #{method}: Assertion \"#{expression}\" failed#{message ? "\n#{message}" : ""}")
end

def get_caller_location_for_assure(options = {:depth => 2})
    caller_method = caller(options[:depth])[0]
    #Sample output is:
    #   test/unit/assure_test.rb:9:in `test_assure
    #   test.rb:3
    caller_method =~ /([^:]+):([0-9]+)(:in `(.+)')*/
    file = $1
    line = $2
    method = $4
    [file, method, line]
end

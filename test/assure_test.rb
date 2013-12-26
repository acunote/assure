# Copyright (c) 2011 Pluron, Inc.

require 'test/unit'
require 'assure'

class AssureTest < Test::Unit::TestCase

    def test_basic_ruby_1_8
        return if RUBY_VERSION >= "1.9.0"

        assure("Test".is_a? String)

        exception = assert_raise(RuntimeError) do
            assure(false)
        end
        assert_equal 'test/assure_test.rb:14: test_basic_ruby_1_8: Assertion "false" failed', exception.message

        exception = assert_raise(RuntimeError) do
            assure(nil)
        end
        assert_equal 'test/assure_test.rb:19: test_basic_ruby_1_8: Assertion "nil" failed', exception.message

        exception = assert_raise(RuntimeError) do
            x = 2
            assure( x == 3, "#{x} == 2" )
        end
        assert_equal "test/assure_test.rb:25: test_basic_ruby_1_8: Assertion \"x == 3, \"\#{x} == 2\"\" failed\n2 == 2", exception.message

        exception = assert_raise(RuntimeError) do
            assure(1.is_a? String)
        end
        assert_equal 'test/assure_test.rb:30: test_basic_ruby_1_8: Assertion "1.is_a? String" failed', exception.message
    end

    def test_basic_ruby_1_9_and_later
        return if RUBY_VERSION < "1.9.0"
        assure("Test".is_a? String)

        exception = assert_raise(RuntimeError) do
            assure(false)
        end
        assert_equal '/test/assure_test.rb:40: block in test_basic_ruby_1_9_and_later: Assertion "false" failed', exception.message

        exception = assert_raise(RuntimeError) do
            assure(nil)
        end
        assert_equal '/test/assure_test.rb:45: block in test_basic_ruby_1_9_and_later: Assertion "nil" failed', exception.message

        exception = assert_raise(RuntimeError) do
            x = 2
            assure( x == 3, "#{x} == 2" )
        end
        assert_equal "/test/assure_test.rb:51: block in test_basic_ruby_1_9_and_later: Assertion \"x == 3, \"\#{x} == 2\"\" failed\n2 == 2", exception.message

        exception = assert_raise(RuntimeError) do
            assure(1.is_a? String)
        end
        assert_equal '/test/assure_test.rb:56: block in test_basic_ruby_1_9_and_later: Assertion "1.is_a? String" failed', exception.message
    end

end

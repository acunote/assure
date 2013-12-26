# Copyright (c) 2011 Pluron, Inc.

require 'test/unit'
require 'assure'

class AssureTest < Test::Unit::TestCase

    def test_basic
        assure("Test".is_a? String)

        exception = assert_raise(RuntimeError) do
            assure(false)
        end
        assert_equal 'test/assure_test.rb:12: test_basic: Assertion "false" failed', exception.message

        exception = assert_raise(RuntimeError) do
            assure(nil)
        end
        assert_equal 'test/assure_test.rb:17: test_basic: Assertion "nil" failed', exception.message

        exception = assert_raise(RuntimeError) do
            x = 2
            assure( x == 3, "#{x} == 2" )
        end
        assert_equal "test/assure_test.rb:23: test_basic: Assertion \"x == 3, \"\#{x} == 2\"\" failed\n2 == 2", exception.message

        exception = assert_raise(RuntimeError) do
            assure(1.is_a? String)
        end
        assert_equal 'test/assure_test.rb:28: test_basic: Assertion "1.is_a? String" failed', exception.message
    end

end

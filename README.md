assure
======
Provides two methods: internal_error and assure


internal_error
--------------
Raises internal error with a given message.


assure
------
Raises internal error when expression evaluates to nil or false.
Use this to check various preconditions, for example:

    def do_smth(x)
        assure(x.is_a? String)
    end

You can provide optional message to be printed in the exception output.

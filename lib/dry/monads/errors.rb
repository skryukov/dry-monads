module Dry
  module Monads
    # An unsuccessful result of extracting a value from a monad.
    class UnwrapError < StandardError
      def initialize(ctx)
        super("value! was called on #{ ctx.inspect }")
      end
    end

    # An error thrown on returning a Failure of unknown type.
    class InvalidFailureTypeError < StandardError
      def initialize(failure)
        super("Cannot create Failure from #{ failure.inspect }, it doesn't meet the constraints")
      end
    end

    # Improper use of None
    class ConstructorNotAppliedError < NoMethodError
      def initialize(method_name, constructor_name)
        super(
          "For calling .#{method_name} on #{constructor_name}() build a value "\
          "by appending parens: #{constructor_name}()"
        )
      end
    end
  end
end

#!/usr/bin/env ruby
# frozen_string_literal: true

module Pecan
  # Abstract representation of a component attribute as a key-value pair.
  #
  # @author Nathan Campos <nathan@innoveworkshop.com>
  class Attribute
    attr_accessor :name, :value

    # Initializes a component attribute.
    #
    # @param name [String] Descriptive name of the attribute.
    # @param value [String] Value of the specified attribute.
    def initialize(name = nil, value = nil)
      @name = name
      @value = value
    end

    # String representation of this object just as it is represented in an
    # attribute file.
    #
    # @return [String] Object as represented in an attribute file.
    def to_s
      "#{@name}\t#{value}\n"
    end

    # @see to_s
    def to_str
      to_s
    end
  end
end

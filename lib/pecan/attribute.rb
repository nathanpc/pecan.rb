#!/usr/bin/env ruby
# frozen_string_literal: true

module Pecan
  # Abstract representation of a component attribute as a key-value pair.
  #
  # @author Nathan Campos <nathan@innoveworkshop.com>
  class Attribute
    # @return [String] Descriptive name of the attribute.
    attr_accessor :name

    # @return [String] Value of the attribute.
    attr_accessor :value

    # Initializes a component attribute.
    #
    # @param name [String] Descriptive name of the attribute.
    # @param value [String] Value of the specified attribute.
    def initialize(name = nil, value = nil)
      @name = name
      @value = value
    end

    # Initializes a component attribute from an attribute file line.
    #
    # @param line [String] Attribute file line.
    #
    # @return [Attribute] Parsed attribute object from line.
    def self.from_line(line)
      attr = new

      # Make sure we have a valid line.
      line = line.strip
      return nil if line.empty?

      # Parse line and populate the object.
      str = line.split("\t", 2)
      attr.name = str[0]
      attr.value = str[1]

      attr
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

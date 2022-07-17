#!/usr/bin/env ruby
# frozen_string_literal: true

module Pecan
  # Deals with virtual electronic component files known as Pecan component
  # archives.
  #
  # @author Nathan Campos <nathan@innoveworkshop.com>
  class Archive
    # @return [Array<Attribute>] Manifest attributes.
    attr_accessor :attribs

    # @return [Array<Attribute>] Parameter attributes.
    attr_accessor :params

    # @return [Image] Component image file blob.
    attr_accessor :image

    # @return [Blob] Binary blob of the PDF datasheet.
    attr_accessor :datasheet

    # Initializes a brand new, empty, component archive object.
    def initialize
      @attribs = []
      @params = []
    end

    # Dumps the contents of the object in a human-readable format.
    def dump_contents
      puts "Manifest: [#{@attribs.length}]"
      @attribs.each { |attr| puts "\t'#{attr.name}' = '#{attr.value}'" }

      puts "Parameters: [#{@params.length}]"
      @params.each { |attr| puts "\t'#{attr.name}' = '#{attr.value}'" }
    end
  end
end

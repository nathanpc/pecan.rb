#!/usr/bin/env ruby
# frozen_string_literal: true

require 'stringio'
require 'minitar'

require 'pecan/attribute'

module Pecan
  # Deals with virtual electronic component files known as Pecan component
  # archives.
  #
  # @author Nathan Campos <nathan@innoveworkshop.com>
  class Archive
    MANIFEST_FILE  = 'manifest.tsv'
    PARAM_FILE     = 'parameters.tsv'
    IMAGE_FILE     = 'image.bmp'
    DATASHEET_FILE = 'datasheet.pdf'

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

    # Reads an component archive and returns an populated object that represents
    # it.
    #
    # @param path [String] Path to the component archive to be read.
    #
    # @return [Archive] Object representation of the component archive.
    def self.read_archive(path)
      archive = new

      # Open the TAR archive.
      Minitar::Input.open(File.open(path, 'rb')) do |tar|
        # Go through entries inside the tar file.
        tar.each do |entry|
          # Parse each file in its own way.
          case entry.full_name
          when MANIFEST_FILE
            # Manifest attributes file.
            StringIO.new(entry.read).each_line do |line|
              attr = Attribute.from_line(line)
              archive.attribs.append(attr) unless attr.nil?
            end
          when PARAM_FILE
            # Parameters attributes file.
            StringIO.new(entry.read).each_line do |line|
              attr = Attribute.from_line(line)
              archive.params.append(attr) unless attr.nil?
            end
          end
        end
      end

      archive
    end

    # Dumps the contents of the object in a human-readable format.
    def dump_contents
      puts "Manifest: [#{@attribs.length}]"
      @attribs.each { |attr| puts "    '#{attr.name}' = '#{attr.value}'" }

      puts "Parameters: [#{@params.length}]"
      @params.each { |attr| puts "    '#{attr.name}' = '#{attr.value}'" }
    end
  end
end

#!/usr/bin/env ruby
# frozen_string_literal: true

require 'stringio'
require 'minitar'

require 'archive/pecan/attribute'
require 'archive/pecan/blob'

module Archive
  # Deals with virtual electronic component files known as Pecan component
  # archives.
  #
  # @author Nathan Campos <nathan@innoveworkshop.com>
  class Pecan
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
      @image = nil
      @datasheet = nil
    end

    # Reads an component archive and returns an populated object that
    # represents it.
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
              archive.attribs << attr unless attr.nil?
            end
          when PARAM_FILE
            # Parameters attributes file.
            StringIO.new(entry.read).each_line do |line|
              attr = Attribute.from_line(line)
              archive.params << attr unless attr.nil?
            end
          when IMAGE_FILE
            # Component image file.
            archive.image = Blob.new('image/bmp', entry.read)
          when DATASHEET_FILE
            # Component datasheet file.
            archive.datasheet = Blob.new('application/pdf', entry.read)
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

      puts 'Has image' unless @image.nil?
      puts 'Has datasheet' unless @datasheet.nil?
    end
  end
end

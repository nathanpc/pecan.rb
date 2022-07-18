#!/usr/bin/env ruby
# frozen_string_literal: true

require 'base64'

module Archive
  class Pecan
    # Abstract representation of a binary blob in an component archive.
    #
    # @author Nathan Campos <nathan@innoveworkshop.com>
    class Blob
      # @return [String] MIME type of the data contained in the blob.
      attr_accessor :mime_type

      # @return [#read] Blob of binary data.
      attr_accessor :blob

      # Initializes the blob object with data.
      #
      # @param mime_type [String] MIME type of the binary blob.
      # @param blob [#read] Blob of binary data.
      def initialize(mime_type, blob)
        @mime_type = mime_type
        @blob = blob
      end

      # String representation of the binary blob.
      #
      # @return [String] Base64-encoded URI string of the binary data.
      def to_s
        "data:#{@mime_type};charset=utf-8;base64,#{Base64.encode64(@blob)}"
      end

      # @see to_s
      def to_str
        to_s
      end
    end
  end
end

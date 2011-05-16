# coding: utf-8
require 'aws/s3'

module GyomuRuby
  module AmazonWebService
    class FileBucket
      attr_accessor :backend

      extend Forwardable
      def_delegators :backend, *%w[bucket get delete]

      def initialize(bucket = 'bucket')
        @backend = Rails.env.production? || Rails.env.staging? ?  RichMan.new(bucket) : PoorMan.new(bucket)
      end

      def put(io)
        "#{Time.now.strftime('%Y%m%d%H%M')}_#{ActiveSupport::SecureRandom.hex(5)}".tap do |key|
          @backend.put(key, io)
        end
      end

      class PoorMan
        require 'fileutils'

        attr_reader :bucket
        def initialize(bucket)
          @bucket = bucket
          path = Rails.root.join('tmp', @bucket)
          FileUtils.mkdir_p path unless FileTest.exist? path
        end

        def put(key, io)
          File.open(Rails.root.join('tmp', @bucket, key), 'w:BINARY') {|f| f.write(io.read)}
        end

        def get(key)
          File.open(Rails.root.join('tmp', @bucket, key), 'r:BINARY') {|f| f.read }
        end

        def delete(key)
          !!FileUtils.rm_r(Rails.root.join('tmp', @bucket, key))
        end
      end

      class RichMan
        attr_reader :bucket
        def initialize(bucket)
          @bucket = bucket
          AWS::S3::Bucket.find(@bucket)
        rescue AWS::S3::NoSuchBucket
          AWS::S3::Bucket.create(@bucket)
        end

        def put(key, io)
          AWS::S3::S3Object.store(key, io, @bucket)
        end

        def get(key)
          AWS::S3::S3Object.value(key, @bucket) rescue nil
        end

        def delete(key)
          AWS::S3::S3Object.delete(key, @bucket) rescue false
        end
      end
    end
  end
  AWS = AmazonWebService
end

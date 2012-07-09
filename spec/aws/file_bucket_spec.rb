require 'spec_helper'
require 'stringio'
require 'gyomu_ruby/amazon_web_service/file_bucket'

describe GyomuRuby::AWS::FileBucket::RichMan do
  describe '.store_options' do
    let(:options) { GyomuRuby::AWS::FileBucket::RichMan.store_options(content) }
    let(:root) { Pathname.new(File.dirname(__FILE__) + '/../../') }
    subject &:options

    context 'store Image files' do
      let(:content) { File.open(root + 'spec/fixtures/images/esm-gravater.png', 'r:BINARY') }
      it { should == {'content-type' => 'image/png', 'content-disposition' => 'inline' } }
    end

    context 'store Text files' do
      let(:content) { File.open(root + 'README.md', 'r:BINARY') }
      it { should == {'content-type' => 'text/plain'} }
    end

    context 'ignore when StringIO or so' do
      let(:content) { StringIO.new('hi')}
      it { should == {} }
    end
  end
end


require "spec_helper"
describe Validator::Xml2 do
		before(:each) do
		@public_key_path  = File.expand_path("../rsa/public.key", __FILE__)
		@private_key_path = File.expand_path("../rsa/private.key", __FILE__)
		@xml              = File.open(File.expand_path("../xml/example_xml2.xml", __FILE__))
		@conf             = ServipagConfiguration::Configuration.new("test", File.expand_path("..",__FILE__))
	end
	it "should validate a signature" do
		@payment_confirmation  =  Servipag::ApiResponse::PaymentConfirmation.new @xml
		Validator::Xml2.validate_signature(@payment_confirmation, @private_key_path).should be_true
	end
end
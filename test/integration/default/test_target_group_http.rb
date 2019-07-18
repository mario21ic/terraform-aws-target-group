# frozen_string_literal: true

require 'awspec'
require 'aws-sdk'
require 'rhcl'

# should strive to randomize the region for more robust testing
example_main = Rhcl.parse(File.open('examples/test_fixtures/main.tf'))
# puts "example_main #{example_main['module']}"

vpc_id = example_main['module']['http']['vpc_id']
tg_env = example_main['module']['http']['env']
tg_name = tg_env + "-tg-" + example_main['module']['http']['name']
tg_count = example_main['module']['http']['count']

state_file = 'examples/test_fixtures/terraform.tfstate.d/kitchen-terraform-default-aws/terraform.tfstate'
tf_state = JSON.parse(File.open(state_file).read)
# puts "tf_state#{tf_state}"

# region = tf_state['modules'][0]['outputs']['region']['value']
# ENV['AWS_REGION'] = region
#
# ec2 = Aws::EC2::Client.new(region: region)
#
# azs = ec2.describe_availability_zones
# zone_names = azs.to_h[:availability_zones].first(2).map { |az| az[:zone_name] }

tg_count.times do |item|
  describe alb_target_group(tg_name + "-" + item.to_s) do
    it { should exist }
    its(:health_check_path) { should eq '/v1/health' }
    its(:health_check_port) { should eq 'traffic-port' }
    its(:health_check_protocol) { should eq 'HTTP' }

    # it { should have_ec2('my-ec2') }
  # it { should belong_to_alb('my-alb') }
    it { should belong_to_vpc(vpc_id) }
  end
end
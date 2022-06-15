provider "alicloud" {
 region = "cn-beijing"
}
# 安全组
resource "alicloud_security_group" "group" {
 name = "slb-test"
vpc_id = alicloud_vpc.vpc.id
}
# 安全组规则
resource "alicloud_security_group_rule" "allow_all_tcp" {
 type = "ingress"
 ip_protocol  = "tcp"
 nic_type = "intranet"
 policy = "accept"
 port_range = "1/65535"
 priority = 1
 security_group_id = alicloud_security_group.group.id
 cidr_ip  = "0.0.0.0/0"
}
# 专用网络
resource "alicloud_vpc" "vpc" {
 vpc_name = "slb-test"
 cidr_block = "172.16.0.0/16"
}
# 交换机
resource "alicloud_vswitch" "vswitch" {
 vpc_id = alicloud_vpc.vpc.id
 cidr_block = "172.16.0.0/24"
 zone_id = "cn-beijing"
 vswitch_name = "slb-test"
}

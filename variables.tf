variable "instance_number" {
 default = 2
 descrpition=”实例数量“
}
variable "cpu_core_count" {
 default = 1
 descrpition=”CPU规格“
}
variable "memory_size" {
 default = 2
 descrpition=”内存规格“
}
variable "image_id" {
 default = "centos_7_6_x64_20G_alibase_20211130.vhd"
 description = "镜像id"
}

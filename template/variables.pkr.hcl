     // PROXMOX Credentials
variable "proxmox_api_url" {
    type = string
    sensitive = true
}
variable "proxmox_api_token_id" {
    type = string
    sensitive = true
}
variable "proxmox_api_token_secret" {
    type = string
    sensitive = true
}
variable "proxmox_insecure_skip_tls_verify" {
    type = bool
    sensitive = true
}
variable "proxmox_node" {
    type = string
    sensitive = true
}
     //Tempalte settings
    // VM System Settings
variable "qemu_agent" {
    type = bool
    default = true
}
variable "cores" {
    type = number
    default = 2
}
variable "memory" {
    type = number
    default = 2048
}
variable "scsi_controller" {
    type = string
    default = "virtio-scsi-pci"
}
variable "vm_id" {
    type = number
}
variable "vm_name" {
    type = string
}
     // ISO settings
variable "iso_url" {
    type = string
}
variable "iso_checksum" {
    type = string
}
variable "iso_storage_pool" {
    type = string
    default = "local"
}
variable "unmount_iso" {
    type = bool
    default = true
}
     // VM Cloud-Init Settings
variable "cloud_init" {
    type = bool
    default = true
}
variable "cloud_init_storage_pool" {
    type = string
    default = "local"
}

variable "disks" {
  type = list(object({
    type          = string
    disk_size     = string
    format        = string
    storage_pool  = string
    storage_pool_type  = string
  }))
  description = "disk setting vm"
  default = [
    {
    type          = "virtio"
    disk_size     = "20G"
    format        = "raw"
    storage_pool  = "local"
    storage_pool_type   = "lvm"
    }
  ]
}
variable "network_adapters" {
  type = list(object({
    model       = string
    bridge      = string
    firewall    = bool
  }))
  description = "Network setting vm"
  default = [
    {
    model       = "virtio"
    bridge      = "vmbr2"
    firewall    = false
    }
  ]
}
variable "boot_command" {
    type = list(string)
}
variable "user_ssh" {
    type = string
    default = "root"
}
variable "password_ssh" {
    type = string
}
#variable "ssh_key" {
#    type = string
#}
#variable "file_source" {
#    type = string
#    default = "http/cloud.cfg"
#}
#variable "file_dest" {
#    type = string
#    default = "/etc/cloud/cloud.cfg"
#}
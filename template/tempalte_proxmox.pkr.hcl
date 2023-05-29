locals {
  buildtime = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp())
}

source "proxmox-iso" "template" {
    proxmox_url               = var.proxmox_api_url
    username                  = var.proxmox_api_token_id
    token                     = var.proxmox_api_token_secret
    insecure_skip_tls_verify  = var.proxmox_insecure_skip_tls_verify
    node                      = var.proxmox_node
    iso_url                   = var.iso_url
    iso_checksum              = var.iso_checksum
    iso_storage_pool          = var.iso_storage_pool
    unmount_iso               = var.unmount_iso
    vm_id                     = var.vm_id
    vm_name                   = var.vm_name
    template_description      = "Создан ${local.buildtime}."
    qemu_agent                = var.qemu_agent
    cores                     = var.cores
    cpu_type                  = "host"
    memory                    = var.memory
    machine                   = "q35" 
    scsi_controller           = var.scsi_controller
    cloud_init                = var.cloud_init
    cloud_init_storage_pool   = var.cloud_init_storage_pool
    dynamic "disks" {
      for_each = var.disks
      content {
        type          = disks.value.type
        disk_size     = disks.value.disk_size
        format        = disks.value.format
        storage_pool  = disks.value.storage_pool
        storage_pool_type   = disks.value.storage_pool_type
      }
    }
    dynamic "network_adapters" {
      for_each = var.network_adapters
      content {
        model       = network_adapters.value.model
        firewall    = network_adapters.value.firewall
        bridge      = network_adapters.value.bridge
      }
    }
    # PACKER Boot Commands
    boot_command          = var.boot_command
    boot_wait             = "10s"
    http_directory        = "http" 
    ssh_username          = var.user_ssh
    ssh_password          = var.password_ssh
#    ssh_private_key_file  = var.ssh_key
    ssh_timeout           = "20m"
}

build {
    name        = var.vm_name
    sources = ["source.proxmox-iso.template"]

    #provisioner "file" {
    #  source      = var.file_source
    #  destination = var.file_dest
    #}
    provisioner "file" {
      source      = "http/cloud.cfg"
      destination = "/etc/cloud/cloud.cfg"
    }
    provisioner "file" {
      source      = "http/99_pve.cfg"
      destination = "/etc/cloud/cloud.cfg.d/99_pve.cfg"
    }
    provisioner "shell" {
        inline = [
            "rm /etc/ssh/ssh_host_*",
            "truncate -s 0 /etc/machine-id",
            "cloud-init clean",
            "rm -f /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg",
            "sync"
        ]
    }
}
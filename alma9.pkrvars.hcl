boot_command = [
            "<esc><wait>","linux inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/kickstart.cfg<enter><wait>"
    ]
vm_id                       = "151"     //Tempalte settings
vm_name                     = "alma9-server"
iso_url                     = "http://mirror.yandex.ru/almalinux/9.0/isos/x86_64/AlmaLinux-9-latest-x86_64-minimal.iso"    // ISO settings
iso_checksum                = "d9c644122aafdb3aa6b635d252d59d7f719fa5de5e77ec103eff9c5fe291c1b6"
password_ssh    = "Qwerta123!!!" // password connect packer//
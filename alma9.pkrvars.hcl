boot_command = [
            "<esc><wait>","linux inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/kickstart.cfg<enter><wait>"
    ]
vm_id                       = "151"     //Tempalte settings
vm_name                     = "alma9-server"
iso_url                     = "http://mirror.yandex.ru/almalinux/9/isos/x86_64/AlmaLinux-9-latest-x86_64-minimal.iso"    // ISO settings
iso_checksum                = "51ee8c6dd6b27dcae16d4c11d58815d6cfaf464eb0e7c75e026f8d5cc530b476"
password_ssh    = "Qwerta123!!!" // password connect packer//

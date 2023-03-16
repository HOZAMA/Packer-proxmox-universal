boot_command = [
    "<esc><wait>",
    "e<wait>","<down><down><down><end>","<bs><bs><bs><bs><wait>",
    "autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---<wait>","<f10><wait>"
    ]
vm_id                       = "150"                 //Tempalte settings
vm_name                     = "ubuntu22-server"
iso_url                     = "https://releases.ubuntu.com/22.04/ubuntu-22.04.2-live-server-amd64.iso"    // ISO settings
iso_checksum                = "5e38b55d57d94ff029719342357325ed3bda38fa80054f9330dc789cd2d43931"
password_ssh    = "Qwerta123" // password connect packer// Не изменять Has пароль в template/http/user-data
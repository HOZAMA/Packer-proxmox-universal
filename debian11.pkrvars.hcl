boot_command   = ["<esc><wait>auto url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg<enter>"]
vm_id                       = "152"                 //Tempalte settings
vm_name                     = "debian11-server"
iso_url                     = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.6.0-amd64-netinst.iso"     // ISO settings
iso_checksum                = "224cd98011b9184e49f858a46096c6ff4894adff8945ce89b194541afdfd93b73b4666b0705234bd4dff42c0a914fdb6037dd0982efb5813e8a553d8e92e6f51"
password_ssh    = "Qwerta123!!!" // password connect packer//
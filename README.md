# Packer-proxmox-universal

### На данный момент шаблон создает темплейты с рабочим cloud-init для Debian Almalinux Ubuntu

## Подготовка к запуску

Необходимо заполнить файлы с перемеными

credentials.pkr.hcl - API PROXMOX
template/varibles.pkr.hcl - Переменные в ВМ / Сайзинги темлейта/ Настройки ВМ
+
Желательно пробежаться по файлам в директории template/http/

##Запуск создания темплейтов

```console
cd /Packer-proxmox-universal/template
packer build -var-file ../credentials.pkr.hcl -var-file ../alma9.pkrvars.hcl .
packer build -var-file ../credentials.pkr.hcl -var-file ../ubuntu22.pkrvars.hcl .
packer build -var-file ../credentials.pkr.hcl -var-file ../debian11.pkrvars.hcl .
```

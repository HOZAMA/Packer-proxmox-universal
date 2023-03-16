# Packer-proxmox-universal

### На данный момент шаблон создает темплейты с рабочим cloud-init для Debian Almalinux Ubuntu

## Подготовка к запуску
Необходимо иметь рабочий DHCP сервер.
По умолчанию используеться интерфей vmbr2. Переменная находиться в template/varibles.pkr.hcl

```hcl
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
```
Или же можно добавить в файлы переменных  OS (Пример alma9.pkrvars.hcl)
Для изменения интерфейсв:
```yml
network_adapters = [
    {
        model      = "virtio"
        bridge     = "vmbr2"
        firewall   = false
    }
]
``` 
Для добавления нового интерфейса:
```yml
network_adapters = [
    network_adapters = {
        model      = "virtio"
        bridge     = "vmbr2"
        firewall   = false
    },
    network_adapters = {
        model      = "virtio"
        bridge     = "vmbr0"
        firewall   = false
    }
]
``` 

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
После создания вм, в proxmox заходим на вкладку cloud-init, указываем пользователя, пароль, настройка сетевого интерфейса

Поддержка автоматического расширения LVM (Не очень красиво напимсана | Но работает).

После кланирования ВМ, увеличить диск на вкладке Hardware в PROXMOX. Запускаем, и получаем расширение корневого каталога LVM автоматом.
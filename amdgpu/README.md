# Tutorial para HABILITAR à sua AMDGPU

> by Felipe Facundes
###### Grupo Telegram: https://t.me/winehq_linux
###### Canal Telegram: https://t.me/s/PlayOnGit
###### Site: https://linuxgamers.github.io/

<br></br>

#### Primeiro verifique se à sua placa é:

> Southern Islands (SI) ou Sea Islands (CIK)

https://www.x.org/wiki/RadeonFeature/

1. **Para o GRUB.** Execute:

`sudo nano /etc/default/grub`

```
Para Southern Islands (SI) o parâmetro é: radeon.si_support=0 amdgpu.si_support=1
Para Sea Islands (CIK) o parâmetro é: radeon.cik_support=0 amdgpu.cik_support=1
```

###### Exemplo:

###### Adicione em:

```
GRUB_CMDLINE_LINUX_DEFAULT="radeon.cik_support=0 amdgpu.cik_support=1"
```

#### Diferente das opções acima. Esta é uma opção UNIVERSAL. Você poderá incluir todos esses parâmetros abaixo, é até melhor, pois não precisará destinguir se à sua placa é SI ou CIK:

```
GRUB_CMDLINE_LINUX_DEFAULT="radeon.cik_support=0 radeon.si_support=0 amdgpu.cik_support=1 amdgpu.si_support=1 amdgpu.dpm=1 amdgpu.dc=1"
```

##### Para o caso de congelamentos, exemplo de congelamento: "[drm] IP block:gmc_v8_0 is hung!", inclua esse parâmetro adicional. TODAVIA, ATENÇÃO, ESSA É UMA OPÇÃO EM ÚLTIMO CASO, POIS O SEU SERVIDOR X PODERÁ NÃO INICIAR:

`amdgpu.vm_update_mode=3`

2. **Para ativar os Modulos.** Execute:

`sudo nano /etc/modprobe.d/amdgpu.conf`

###### E adicione:

```
options amdgpu si_support=1
options amdgpu cik_support=1
```

3. **Para o XORG.** Execute:

`sudo nano /etc/X11/xorg.conf.d/20-amdgpu.conf`

###### E adicione:

```
Section "Device"
	Identifier "AMD"
	Driver "amdgpu"
	Option "TearFree" "on"
	Option "EnablePageFlip" "on"
	Option "AccelMethod" "exa" #ou: "glamor"
	Option "TripleBuffer" "true"
    	Option "UseFastTLS" "2"
	Option "DRI" "3"
	Option "Tiling" "true"
	Option "SwapbuffersWait" "true"
	Option "XvVsync" "0"
	Option "EXAVSync" "off"
EndSection

Section "Extensions"
    Option "Composite" "enable"
EndSection
```

`sudo nano /etc/X11/xorg.conf.d/serverflags.conf`

###### E adicione:

```
Section "ServerFlags"
   Option "BlankTime" "0"
   Option "StandbyTime" "0"
   Option "SuspendTime" "0"
   Option "OffTime" "0"
   Option "DRI3" "on"
   Option "GlxVisuals" "all"
EndSection
```

4. **Para o MKINITCPIO (initramfs).** Execute:

`sudo nano /etc/mkinitcpio.conf`

###### E adicione em:

```
MODULES=(amdgpu radeon)
```

5. **ESSES DOIS ÚLTIMOS COMANDOS PARA FINALIZAR:**

```
sudo mkinitcpio -p linux
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

- Reinicie o computador ou notebook

  - Teste o vulkan:


  1. `vulkaninfo`
  
  2. `vkcube`

# OPCIONAL: 
## GPU OverClock
```
su -c 'echo "c" > /sys/class/drm/card0/device/pp_od_clk_voltage'
su -c 'echo high > /sys/class/drm/card0/device/power_dpm_force_performance_level'
su -c 'echo performance > /sys/class/drm/card0/device/power_dpm_state'
su -c 'echo "7" > /sys/class/drm/card0/device/pp_sclk_od'
su -c 'echo "4" > /sys/class/drm/card0/device/pp_mclk_od'
su -c 'echo 4 > /sys/class/drm/card0/device/pp_power_profile_mode'
```
### Controle do cooler
```
su -c 'echo "1" > /sys/class/drm/card0/device/hwmon/hwmon0/pwm1_enable'
su -c 'echo "150" > /sys/class/drm/card0/device/hwmon/hwmon0/pwm1'
```
### Obter informações
`sudo watch -n 0.5 cat /sys/kernel/debug/dri/0/amdgpu_pm_info`
### Para resetar
`su -c 'echo "r" > /sys/class/drm/card0/device/pp_od_clk_voltage'`

<br></br>

```
                    ,cldxOxoc:;,
               ,;:okKNXKK0kO0Okxddol:;,
        ,;codxkkOKXKko:'......,;clx0KXXOxol:,
   :lodxxdololc:,'..................,cdk00kxkOkxoc,
  ;XOxdl:,..  .......................... ..,;lx0XNx
  lX0c      ..;dddddooooollll,............     .0XO'
  oKK;    ....0NNXXKKK00OOOkx'.............     x0x,
  lXX;   ....,WWNNNKdddoooooc.'..............   okk,
  cXW:  .....xWWWWWl''''''''''''''............  dd0,
  :OWo ......NMMMMWOkkkkxxxc''''''''.......... .kxK'
  ,dKk .....lWWWWMMMWWWNNNX:,''''''''...........KOx'
  ,lk0......ONNNWWddddddddo,,,,,''''''.........lNOc'
  'cdk;....;KXXXNO''',,,,,,,ddddoooolllccc:....0WO,'
  ',ddd....o0KKKXl'',,,,,,,lWWNNNXXKKK00OOc...,0Xx'
   'llo;...kO00K0,'',,,,,,,0MWWWN0OOOkkkxx'...oxK;'
   ',xcl..,lloool''',,,,,,:WWMMMX''''''......cxko'
    ':x:c......''''''',,,,xNWWWM0dddddool...:00O,'
     'ld::.......'''''',,,KNNNWWWMMMWWWWx..;XXK;'
      'dd::.......'''''''lKXXNN0kkOOOkkk;.;0KK;'
       'ox::........'''''x0KKKX;'''......lK0k;'
        'cx:c,........'.,OO00KO........'kN0o,'
         ',dllc'........lkkOO0c.......:KNk:'
           ':lldc.......oodddd'.....,d0Oc,'
            ',:ldxl'..............'lxxo;,'
              ',;lx0x;..........,cldo:'
               '',cxXXd,....,cdxkd:'
                   ',;o0N0odkkkk,'
                     ',;lxdl:,'
 
 Tutorial by:
 ___    _             ___                     _
| __|__| (_)_ __  ___| __|_ _ __ _  _ _ _  __| |___ ___
| _/ -_) | | '_ \/ -_) _/ _` / _| || | ' \/ _` / -_|_-<
|_|\___|_|_| .__/\___|_|\__,_\__|\_,_|_||_\__,_\___/__/
           |_|

┏┓
┃┃╱╲ nesta
┃╱╱╲╲ casa
╱╱╭╮╲╲ todos
▔▏┗┛▕▔ usam
╱▔▔▔▔▔▔▔▔▔▔╲
LINUX
╱╱┏┳┓╭╮┏┳┓ ╲╲
▔▏┗┻┛┃┃┗┻┛▕▔
--------------------------
```


###### #tutorialvulkan
###### #radv
###### #vulkanradv
###### #vulkanamd
###### #amdgpu

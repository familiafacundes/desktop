# Comandos: OpenRC vs Systemd


           Comando          |                            OpenRC                                |             Systemd
                            |                                                                  |
:--------------------------:|:----------------------------------------------------------------:|:-----------------------------------:
 Iniciar um serviço         | /etc/init.d/<service> start  "ou" rc-service <service> start     | systemctl start <service>
                            |                                                                  |
 Parar um serviço           | /etc/init.d/<service> stop  "ou" rc-service <service> stop       | systemctl stop <service>
                            |                                                                  |
 Reiniciar um serviço       | /etc/init.d/<service> restart  "ou" rc-service <service> restart | systemctl restart <service>
                            |                                                                  |
 Status do Serviço          | /etc/init.d/<service> status  "ou" rc-service <service> status   | systemctl status <service>
                            |                                                                  |
 Mostrar os scripts         | rc-status  "ou" rc-update show                                   | systemctl list-units
                            |                                                                  |
 Mostrar serviços iniciados | ls /etc/init.d/ "ou" rc-update -v show                    | systemctl list-unit-files --type=service
                            |                                                                  |
 Habilitar serviço          | rc-update add <service> <runlevel>                               | systemctl enable <service>
                            |                                                                  |
 Desabilitar um serviço     | rc-update del <service> <runlevel>                               | systemctl disable <service>


#

> A tabela a seguir é uma lista de comandos úteis do systemd que não possuem o equivalente do OpenRC:


           Comando          |                            Sintaxe
                            |
:--------------------------:|:-----------------------------------------------------------:
 Desabilitar serviços autom.| systemctl mask <service>
                            |
 Matar    serviço           | systemctl kill <service>
                            |
 Mostrar Logs               | journalctl -r --since=today
                            |
 Mostrar evento específico  | journalctl _SYSTEMD_UNIT=<service>.service

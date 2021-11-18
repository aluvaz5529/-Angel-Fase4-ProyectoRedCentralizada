@echo off
REM Comprobamos si existen las carpetas, en caso contrario las creamos
if NOT EXIST F:\departamentos_cs mkdir F:\departamentos_cs
if NOT EXIST F:\departamentos_cs\Servicios_U mkdir F:\departamentos_cs\Servicios_U
if NOT EXIST F:\departamentos_cs\Rectorado mkdir F:\departamentos_cs\Rectorado
if NOT EXIST F:\departamentos_cs\Secretaria mkdir F:\departamentos_cs\Secretaria
if NOT EXIST F:\departamentos_cs\Servicios mkdir F:\departamentos_cs\Informatica
REM Compartimos en red con 'Todos' las carpetas, con los permisos NTFS filtraremos los accesos
@echo off
REM Comprobamos si existen las carpetas, en caso contrario las creamos
REM Compartimos en red con 'Todos' las carpetas, con los permisos NTFS filtraremos los accesos 
net share Documentos_Departamentos=F:\departamentos_cs /GRANT:Cs_GL_RServicios_U,read /GRANT:Cs_GL_RInformatica,read /GRANT:Cs_GL_RSecretaria,read /GRANT:Cs_GL_RRectorado,read 
net share D_Servicios_U=F:\departamentos_cs\Servicios_U /GRANT:Cs_GL_RServicios_U,read /GRANT:Cs_GL_WServicios_U,change
net share D_Rectorado=F:\departamentos_cs\Rectorado /GRANT:Cs_GL_RRectorado,read /GRANT:Cs_GL_WRectorado,change
net share D_Secretaria=F:\departamentos_cs\Secretaria /GRANT:Cs_GL_WSecretaria,change /GRANT:Cs_GL_RSecretaria,read
net share D_Secretaria=F:\departamentos_cs\Secretaria /GRANT:Cs_GL_RSecretaria,read /GRANT:Cs_GL_WInformatica,change
net share D_Informatica=F:\departamentos_cs\Informatica /GRANT:Cs_GL_WInformatica,change /GRANT:Cs_GL_RInformatica,read
REM de aqui hacia arriba no tocar nada que funciona
REM 
REM Aplicamos las ACLs
REM https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/icacls

icacls F:\departamentos_cs\Servicios_U /GRANT castellon\Cs_GL_WServicios_U:W
icacls F:\departamentos_cs\Servicios_U /GRANT castellon\Cs_GL_RServicios_U:R
icacls F:\departamentos_cs\Rectorado /GRANT castellon\Cs_GL_RRectorado:R
icacls F:\departamentos_cs\Rectorado /GRANT castellon\Cs_GL_WRectorado:W
icacls F:\departamentos_cs\Secretaria /GRANT castellon\Cs_GL_RSecretaria:R
icacls F:\departamentos_cs\Secretaria /GRANT castellon\Cs_GL_WSecretaria:W
icacls F:\departamentos_cs\Informatica /GRANT castellon\Cs_GL_RInformatica:R
icacls F:\departamentos_cs\Informatica /GRANT castellon\Cs_GL_WInformatica:W

REM Eliminamos los permisos asignados al grupo 'Usuarios del dominio'
REM /inheritancelevel: [e - d - r]
REM     e: Enables inheritance - d: Disables inheritance and copies the ACESS - r: Removes all inherited ACESS

icacls F:\departamentos_cs\Servicios_U /inheritance:d /T
icacls F:\departamentos_cs\Servicios_U /remove:g Usuarios
icacls F:\departamentos_cs\Rectorado /inheritance:d /T
icacls F:\departamentos_cs\Rectorado /remove:g Usuarios
icacls F:\departamentos_cs\Secretaria /inheritance:d /T
icacls F:\departamentos_cs\Secretaria /remove:g Usuarios
icacls F:\departamentos_cs\Informatica /inheritance:d /T
icacls F:\departamentos_cs\Informatica /remove:g Usuarios

REM Añadimos el permiso extra del grupo Cs_GL_castellon
icacls F:\departamentos_cs\Servicios_U /GRANT castellon\Cs_GL_castellon:(R)
icacls F:\departamentos_cs\Rectorado /GRANT castellon\Cs_GL_castellon:(R)
icacls F:\departamentos_cs\Secretaria /GRANT castellon\Cs_GL_castellon:(R)
icacls F:\departamentos_cs\Informatica /GRANT castellon\Cs_GL_castellon:(R)

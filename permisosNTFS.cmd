
REM Aplicamos las ACLs
REM https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/icacls

icacls C:\Documentación\Dirección /GRANT smr\Dirección:(R,W)
icacls C:\Documentación\Finanzas /GRANT smr\Finanzas:(R,W)
icacls C:\Documentación\Producción /GRANT smr\Producción:(R,W)
icacls C:\Documentación\Servicios /GRANT smr\Servicios:(R,W)
icacls C:\Documentación\Ventas /GRANT smr\Ventas:(R,W)
REM Eliminamos los permisos asignados al grupo 'Usuarios del dominio'
REM /inheritancelevel: [e - d - r]
REM     e: Enables inheritance - d: Disables inheritance and copies the ACESS - r: Removes all inherited ACESS

icacls C:\Documentación\Dirección /inheritance:d /T
icacls C:\Documentación\Dirección /remove:g Usuarios
icacls C:\Documentación\Finanzas /inheritance:d /T
icacls C:\Documentación\Finanzas /remove:g Usuarios
icacls C:\Documentación\Producción /inheritance:d /T
icacls C:\Documentación\Producción /remove:g Usuarios
icacls C:\Documentación\Servicios /inheritance:d /T
icacls C:\Documentación\Servicios /remove:g Usuarios
icacls C:\Documentación\Ventas /inheritance:d /T
icacls C:\Documentación\Ventas /remove:g Usuarios
REM Añadimos el permiso extra del grupo Acceso_extra
icacls C:\Documentación\Dirección /GRANT smr\Acceso_extra:(R)
icacls C:\Documentación\Finanzas /GRANT smr\Acceso_extra:(R)
icacls C:\Documentación\Producción /GRANT smr\Acceso_extra:(R)
icacls C:\Documentación\Servicios /GRANT smr\Acceso_extra:(R)
icacls C:\Documentación\Ventas /GRANT smr\Acceso_extra:(R)


REM esta es la idea el grupo donde estan todos los usuarios con los permisos de lectura y luego 
@echo off
REM Comprobamos si existen las carpetas, en caso contrario las creamos
if NOT EXIST F:\departamentos_cs mkdir F:\departamentos_cs
if NOT EXIST F:\departamentos_cs\Servicios_U mkdir F:\departamentos_cs\Servicios_U
if NOT EXIST F:\departamentos_cs\Rectorado mkdir F:\departamentos_cs\Rectorado
if NOT EXIST F:\departamentos_cs\Secretaria mkdir F:\departamentos_cs\Secretaria
if NOT EXIST F:\departamentos_cs\Servicios mkdir F:\departamentos_cs\Informatica
REM Compartimos en red con 'Todos' las carpetas, con los permisos NTFS filtraremos los accesos
net share D_Departamentos=F:\Departamentos_cs /GRANT:Cs_GL_GGcastellon,read



REM funciona hasta lo de compartir probar por si funciona
@echo off
REM Comprobamos si existen las carpetas, en caso contrario las creamos
if NOT EXIST F:\departamentos_cs mkdir F:\departamentos_cs
if NOT EXIST F:\departamentos_cs\Servicios_U mkdir F:\departamentos_cs\Servicios_U
if NOT EXIST F:\departamentos_cs\Rectorado mkdir F:\departamentos_cs\Rectorado
if NOT EXIST F:\departamentos_cs\Secretaria mkdir F:\departamentos_cs\Secretaria
if NOT EXIST F:\departamentos_cs\Servicios mkdir F:\departamentos_cs\Informatica
REM Compartimos en red con 'Todos' las carpetas, con los permisos NTFS filtraremos los accesos 
net share D_Servicios_U=F:\departamentos_cs\Servicios_U /GRANT:Cs_GG_Servicios_U,full
net share D_Servicios_U=F:\departamentos_cs\Servicios_U /GRANT:Cs_GG_RServicios_U,read
net share D_Servicios_U=F:\departamentos_cs\Servicios_U /GRANT:Cs_GL_WServicios_U,write
net share D_Rectorado=F:\departamentos_cs\Rectorado /GRANT:Cs_GG_Rectorado,full
net share D_Rectorado=F:\departamentos_cs\Rectorado /GRANT:Cs_GL_WRectorado,write
net share D_Rectorado=F:\departamentos_cs\Rectorado /GRANT:Cs_GL_RRectorado,read
net share D_Secretaria=F:\departamentos_cs\Secretaria /GRANT:Cs_GG_Secretaria,full
net share D_Secretaria=F:\departamentos_cs\Secretaria /GRANT:Cs_GL_WSecretaria,write
net share D_Secretaria=F:\departamentos_cs\Secretaria /GRANT:Cs_GL_RSecretaria,read
net share D_Informatica=F:\departamentos_cs\Informatica /GRANT:Cs_GG_Informatica,full
net share D_Informatica=F:\departamentos_cs\Informatica /GRANT:Cs_GL_WInformatica,write
net share D_Informatica=F:\departamentos_cs\Informatica /GRANT:Cs_GL_RInformatica,read
REM Aplicamos las ACLs
REM https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/icacls

icacls F:\departamentos_cs\Servicios_U /GRANT castellon\Servicios_U:(R,W)
icacls F:\departamentos_cs\Rectorado /GRANT castellon\Rectorado:(R,W)
icacls F:\departamentos_cs\Secretaria /GRANT castellon\Secretaria:(R,W)
icacls F:\departamentos_cs\Informatica /GRANT castellon\Informatica:(R,W)



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

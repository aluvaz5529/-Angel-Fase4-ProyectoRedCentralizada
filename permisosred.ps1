#permisos para carpetas del segundo disco (globales)
$SU = 'F:\ruta servicios universitarios'
$RE = 'F:\ruto rectorado'
$SE = 'F:\ruta secretaria'
$IN = 'F:\Servicios_universitarios'

#Creamos la carpeta que hemos añadido en la variable $ruta 
New-Item -Path $SU -ItemType Directory
New-Item -Path $RE -ItemType Directory
New-Item -Path $SE -ItemType Directory
New-Item -Path $IN -ItemType Directory

New-SmbShare -Name Publico-RC -Path $SU -FullAccess SMR-GL-Total-DirPublico -ReadAccess SMR-GL-Read-DirPublic `
-ChangeAccess SMR-GL-Change-DirPublico -ConcurrentUserLimit 28 `
-Description "Carpeta publico para el acceso de usuarios"

#version 2
$SU = 'F:\ruta servicios universitarios'
$RE = 'F:\ruto rectorado'
$SE = 'F:\ruta secretaria'
$IN = 'F:\Servicios_universitarios'

#Creamos la carpeta que hemos añadido en la variable $ruta 
New-Item -Path $SU -ItemType Directory
New-Item -Path $RE -ItemType Directory
New-Item -Path $SE -ItemType Directory
New-Item -Path $IN -ItemType Directory

New-SmbShare -Name Publico-RC -Path $SU -WriteAccess Cs_GL_WServicios_U -ReadAccess Cs_GL_RServicios_U`
-ChangeAccess Cs_GG_Servicios_U -ConcurrentUserLimit 28 `
-Description "Carpeta publico para el acceso de usuarios"

#version 3
$SU = 'F:\ruta servicios universitarios'
$RE = 'F:\ruto rectorado'
$SE = 'F:\ruta secretaria'
$IN = 'F:\Servicios_universitarios'

#Creamos la carpeta que hemos añadido en la variable $ruta 
New-Item -Path $SU -ItemType Directory
New-Item -Path $RE -ItemType Directory
New-Item -Path $SE -ItemType Directory
New-Item -Path $IN -ItemType Directory

New-SmbShare -Name carpetacompartida -Path $SU -WriteAccess Cs_GL_WServicios_U -ReadAccess Cs_GL_RServicios_U` -ChangeAccess Cs_GL_WServicios_U 
-ConcurrentUserLimit 28 `
-Description "Carpeta publico para el acceso de usuarios"

#versión 4 final (si no funciona quitar las comillas de readacces al final)#####################################
$SU = 'F:\ruta servicios universitarios'
$RE = 'F:\ruto rectorado'
$SE = 'F:\ruta secretaria'
$IN = 'F:\Servicios_universitarios'

#Creamos la carpeta que hemos añadido en la variable $ruta 
New-Item -Path $SU -ItemType Directory
New-Item -Path $RE -ItemType Directory
New-Item -Path $SE -ItemType Directory
New-Item -Path $IN -ItemType Directory

New-SmbShare -Name carpetacompartida -Path $SU -WriteAccess Cs_GL_WServicios_U -ReadAccess Cs_GL_RServicios_U` -ChangeAccess Cs_GL_WServicios_U 
-ConcurrentUserLimit 29 `
-Description "Carpeta publico para el acceso de usuarios de servicios universitarios"

New-SmbShare -Name carpetacompartida2 -Path $RE -WriteAccess Cs_GL_WRectorado -ReadAccess Cs_GL_RRectorado` -ChangeAccess Cs_GL_WRectorado
-ConcurrentUserLimit 29 `
-Description "Carpeta publico para el acceso de usuarios de rectorado"

New-SmbShare -Name carpetacompartida3 -Path $SE -WriteAccess Cs_GL_RSecretaria -ReadAccess Cs_GL_WSecretaria` -ChangeAccess Cs_GL_RSecretaria 
-ConcurrentUserLimit 29 `
-Description "Carpeta publico para el acceso de usuarios de secretaria"

New-SmbShare -Name carpetacompartida4 -Path $IN -WriteAccess Cs_GL_RInformatica -ReadAccess Cs_GL_WInformatica` -ChangeAccess Cs_GL_RInformatica 
-ConcurrentUserLimit 29 `
-Description "Carpeta publico para el acceso de usuarios de informatica"

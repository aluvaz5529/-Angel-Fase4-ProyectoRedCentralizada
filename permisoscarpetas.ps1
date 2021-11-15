#permisos para carpteass del segundo disco (globales)
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

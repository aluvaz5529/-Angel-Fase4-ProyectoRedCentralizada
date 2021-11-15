param grupos{
$gruposCsv=Read-Host "Introduce el fichero csv de Grupos"
$fichero = import-csv -Path $gruposCsv -delimiter :
foreach($linea in $fichero)


	New-ADGroup -Name:$linea.Name -Description:$linea.Description -GroupCategory:$linea.Category -GroupScope:$linea.Scope -Path:$linea.Path


}

param red
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






function mostrarMenu 
{ 
     param ( 
           [string]$Titulo = 'Selección de opciones' 
     ) 
     Clear-Host 
     Write-Host "================ $Titulo================" 
      
     
     Write-Host "1. Grupos locales y globales" 
     Write-Host "2. permisos de red" 
     Write-Host "3. permisos NTF" 
     Write-Host "s. Presiona 's' para salir" 
}

do 
{ 
     mostrarMenu 
     $input = Read-Host "Elegir una Opción" 
     switch ($input) 
     { 
           '1' { 
                Clear-Host  
                grupos 
                pause
           } '2' { 
                Clear-Host  
                red
                pause
           } '3' {  
                "en proceso"      
           } 's' {
                'Saliendo del script...'
                return 
           }  
     } 
     pause 
} 
until ($input -eq 's')

#en ruta poner las variables SU RE SE IN
#1. Obtenemos la lista acl (permisos NTFS) de la carpeta
$acl = Get-Acl -Path $ruta
"1.1 Quitamos la herencia copiando los permisos
$acl.SetAccessRuleProtection($true,$true)
$acl | Set-Acl -Path $ruta
#1.2 Eliminamos el grupo Usuarios del dominio (Usuarios)
$acl.Access | Where-Object {$_.IdentityReference -eq "BUILTIN\Usuarios"} | Foreach-Object {$acl.RemoveAccessRule($_) | Out-Null}
$acl | Set-Acl $ruta
#2. Creamos un nuevo FileSystemAccessRule 
$regla = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule("SMR_GL_R_DirPublico", "Read", "Allow") 
#3.Agregar la nueva regla
$acl.SetAccessRule($regla)
#4. Aplicar la nueva ACL al archivo o carpeta (Añadir permisos a la carpeta)
$acl | Set-Acl -Path $ruta


#comprobar permisos
#$acl.Access
#get-acl $ruta | fl

#quitar permisos
#$ruta = 'F:\Publico'
#$acl = Get-Acl -Path $ruta
#$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule ("SMR_GL_R_DirPublico", "Read", "Allow")
#$acl.RemoveAccessRule ($AccessRule)
#$acl | Set-Acl -Path $ruta


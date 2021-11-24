@echo off
REM se guarda en C:\Windows\SYSVOL\sysvol\castellon.upv.es\scripts
IF NOT EXIST C: net use C: \\CAMPUS-CASTELLON\Almacenamiento
msg %username% Recuerda que los datos guardados en los discos locales pueden perderse, utiliza las unidades R: o S:
echo El usuario %username% ha iniciado sesion el %date% a las %time% en el equipo
%computername% >> \\CAMPUS-CASTELLON\log\conexiones.log

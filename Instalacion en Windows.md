# En tu PC
## Preparación del sistema
Antes de iniciar, es recomendable asegurarse de que el sistema cumpla con los requisitos mínimos para correr un nodo completo de Scolcoin.
### Requisitos de Hardware:
- Almacenamiento: Se recomiendan al menos 1TB - 2TB de espacio libre en un SSD. Usar un HDD ralentizará la sincronización drásticamente.
- Memoria RAM: Mínimo 8GB, aunque 16GB es lo recomendado.
- Conexión a Internet: Conexión estable de banda ancha sin límites de datos (la sincronización inicial puede consumir cientos de GB).
- Espacio de trabajo: Crear una carpeta específica, por ejemplo C:\scolcoin\ para el ejecutable.

## Instalación del ejecutable
ubicar en C:\scolcoin\ el archivo:
### Windows 32 bits /Sistemas 32 bits (x86)
http://scolcoin.com/i/geth-windows-386-Scol.exe
### Windows 64 bits / Sistemas 64 bits (x64)
http://scolcoin.com/i/geth-windows-amd64-Scol.exe

## Descarga el archivo Genesis
https://github.com/scolcoin/ScolNetwork/blob/master/genesis.json ubicalo en C:\scolcoin\ o en la unidad D:\scolcoin\

## Ejecución del nodo (Sincronización)
Para montar el nodo en la red principal, se utiliza el comando geth. Es recomendable configurar la carpeta de datos para no saturar el disco C.
- `D:\scolcoin\`

Abre PowerShell o CMD como Administrador y ejecuta:

`cd C:\scolcoin`

`geth --datadir D:\scolcoin\`

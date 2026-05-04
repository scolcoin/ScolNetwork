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
https://github.com/scolcoin/ScolNetwork/blob/master/genesis.json ubicalo en C:\scolcoin\

## Instalamos el genesis:
Para montar el nodo en la red principal, se utiliza el comando geth. Es recomendable configurar la carpeta de datos para no saturar el disco C.
- `D:\scolcoin\`

Abre PowerShell o CMD como Administrador y ejecuta:

`cd C:\scolcoin`

`geth init --datadir D:\scolcoin\ C:\scolcoin\genesis.json`

## Inicializar el nodo
Abre PowerShell o CMD como Administrador y ejecuta:

`cd C:\Scolcoin\`

`geth --datadir D:\scolcoin\ --networkid 65450 --port 30303 --http --http.addr 127.0.0.1 --http.port 8545 --http.api eth,net,web3,admin,clique,txpool,personal --allow-insecure-unlock --syncmode full --gcmode full --http.corsdomain https://remix.ethereum.org --bootnodes "enode://ec679eec262a5e3fe93ae01aaa4640966808cc63fe911264288958db885976aa4cdd981506764e65ebb69d485de83225dcfa813d25de7ae727af44b9d78553cf@185.249.227.142:30303,enode://32ec33aca4244aca2b3bd78e5c14c417f3b2450568292dd65ce0520fc22286b9cf32822db5df2eba4f99477035d01c2f385a7bcf02f3ad81485a507386eba793@158.220.118.217:30303,enode://b463e4fbe3b3e4f4a3fcd5486dbaf6f23ba7e3ddc716544f476be17bf050852fecdd4fba36be509342e75000d99ec34fbbf3903f857e95731e734295722b5812@38.242.226.154:30303,enode://a704d85710ee8ff98fe7564c45aea407265cb1a1c29fa8237f3be3603c12c438217400132e6917952afb70159e7317834ef144516a582d2c3540f6cae0379673@2.59.156.157:30303,enode://ee0b8e1addd6963b1d6650c07401f51a3b3f1b0aa3939605905722460266531a367582002b1ccc9c04198c6f0eaf3aea732f587ef8ddb38004a0659bb87b59f7@213.199.45.11:30303" --verbosity 3 `

## en otra Ventana
Abre PowerShell o CMD como Administrador y ejecuta:

`cd C:\Scolcoin\`

`geth attach http://127.0.0.1:8545`

### Consultar cantidad de Bloques:

`eth.blockNumber`

# Convertir en ejecutable permanente (fondo + auto-inicio)
Para que el nodo siempre esté corriendo incluso al cerrar la terminal o reiniciar el PC:

Crea `C:\scolcoin\start_scolcoin.bat`

batch

`@echo off
cd /d C:\scolcoin
geth.exe --datadir D:\scolcoin\ --networkid 65450 --port 30303 --http --http.addr 127.0.0.1 --http.port 8545 --http.api eth,net,web3,admin,clique,txpool,personal --allow-insecure-unlock --syncmode full --gcmode full --http.corsdomain https://remix.ethereum.org --bootnodes "enode://ec679eec262a5e3fe93ae01aaa4640966808cc63fe911264288958db885976aa4cdd981506764e65ebb69d485de83225dcfa813d25de7ae727af44b9d78553cf@185.249.227.142:30303,enode://32ec33aca4244aca2b3bd78e5c14c417f3b2450568292dd65ce0520fc22286b9cf32822db5df2eba4f99477035d01c2f385a7bcf02f3ad81485a507386eba793@158.220.118.217:30303,enode://b463e4fbe3b3e4f4a3fcd5486dbaf6f23ba7e3ddc716544f476be17bf050852fecdd4fba36be509342e75000d99ec34fbbf3903f857e95731e734295722b5812@38.242.226.154:30303,enode://a704d85710ee8ff98fe7564c45aea407265cb1a1c29fa8237f3be3603c12c438217400132e6917952afb70159e7317834ef144516a582d2c3540f6cae0379673@2.59.156.157:30303,enode://ee0b8e1addd6963b1d6650c07401f51a3b3f1b0aa3939605905722460266531a367582002b1ccc9c04198c6f0eaf3aea732f587ef8ddb38004a0659bb87b59f7@213.199.45.11:30303" --verbosity 3
pause`

o si lo deseas puedes descargar el archivo ya listo y ubicarlo en C:\scolcoin link archivo:
[start_scolcoin.bat](https://github.com/scolcoin/ScolNetwork/blob/master/start_scolcoin.bat)
Nota: estamos ubicando los bloques en la unidad D:\scolcoin\ pero si no tienes debes cambiar la ubicacion a C:\scolcoin\

Haz doble clic en el .bat para iniciarlo (se quedará en la terminal).

# Servicio de Windows (recomendado para 24/7)

Usa NSSM (Non-Sucking Service Manager) para correr Geth como servicio.

Descarga nssm.exe desde https://nssm.cc/download

Colócalo en C:\scolcoin\nssm.exe

### Abre CMD como Administrador:

`cd C:\scolcoin`

`nssm.exe install ScolcoinNode`

Agrega la informacion:

#### Path	
`C:\scolcoin\geth.exe`
#### Startup directory	
`C:\scolcoin`
#### Arguments	
`--datadir D:\scolcoin\ --networkid 65450 --port 30303 --http --http.addr 127.0.0.1 --http.port 8545 --http.api eth,net,web3,admin,clique,txpool,personal --allow-insecure-unlock --syncmode full --gcmode full --http.corsdomain https://remix.ethereum.org --bootnodes "enode://ec679eec262a5e3fe93ae01aaa4640966808cc63fe911264288958db885976aa4cdd981506764e65ebb69d485de83225dcfa813d25de7ae727af44b9d78553cf@185.249.227.142:30303,enode://32ec33aca4244aca2b3bd78e5c14c417f3b2450568292dd65ce0520fc22286b9cf32822db5df2eba4f99477035d01c2f385a7bcf02f3ad81485a507386eba793@158.220.118.217:30303,enode://b463e4fbe3b3e4f4a3fcd5486dbaf6f23ba7e3ddc716544f476be17bf050852fecdd4fba36be509342e75000d99ec34fbbf3903f857e95731e734295722b5812@38.242.226.154:30303,enode://a704d85710ee8ff98fe7564c45aea407265cb1a1c29fa8237f3be3603c12c438217400132e6917952afb70159e7317834ef144516a582d2c3540f6cae0379673@2.59.156.157:30303,enode://ee0b8e1addd6963b1d6650c07401f51a3b3f1b0aa3939605905722460266531a367582002b1ccc9c04198c6f0eaf3aea732f587ef8ddb38004a0659bb87b59f7@213.199.45.11:30303" --verbosity 3`

Ve a la pestaña Details → Startup type: Automatic (para que arranque con Windows)

Haz clic en Install service

### Luego inicia el servicio:
Abre PowerShell o CMD como Administrador y ejecuta:

`cd C:\scolcoin`

`nssm.exe start ScolcoinNode`

### Para verificar logs:
Abre PowerShell o CMD como Administrador y ejecuta:

`cd C:\scolcoin`

`nssm.exe status ScolcoinNode`

### Verificar que el nodo está corriendo

Abre PowerShell o CMD como Administrador y ejecuta:

`cd C:\scolcoin`

`geth.exe attach http://127.0.0.1:8545`

### Nota:
- `eth.syncing`        //  Muestra progreso de sincronización
- `eth.blockNumber`    // Último bloque descargado
- `net.peerCount`      // Cantidad de pares conectados
- `admin.nodeInfo`     // Información del nodo
- `exit`               // Salir

# ScolNetwork

## Funciones de nodos completos
- Almacena el historial completo de la cadena de bloques en el disco y puede responder a la solicitud de datos de la red.
- Recibe y valida los nuevos bloques y transacciones.
- Verifica los estados de todas las cuentas.

## Plataformas compatibles:

Admitimos la ejecución de un nodo completo en Mac OS X y Linux.

## Requisitos sugeridos

## nodo completo
- VPS con versiones recientes de Mac OS X o Linux.
- 4 núcleos de CPU y 8 gigabytes de memoria (RAM).
- Una conexión a Internet de banda ancha con velocidades de carga/descarga de 5 megabytes por segundo.

## Pasos para ejecutar un nodo completo

En tu VPS en Home Crear carpeta de nodos

`mkdir node`

## Descargue geth - scol_mainnet.json - static-nodes.json desde:
`wget https://raw.githubusercontent.com/scolcoin/ScolNetwork/master/scol_mainnet.json`

`wget https://raw.githubusercontent.com/scolcoin/ScolNetwork/master/static-nodes.json`  

`wget https://raw.githubusercontent.com/scolcoin/ScolNetwork/master/geth` 

## Instalamos script auto:
nano add-peers.sh

## Instalamos el geth:

`chmod 777 geth`

`chmod 777 add-peers.sh`

`sudo mv geth /usr/local/bin/`

## Inicializar el nodo

`geth --datadir ./node init scol_mainnet.json`

## Programamos los nodos
crontab -e
@reboot /root/src/add-peers.sh

## Tipos de Nodo
### Nodo Full
`--syncmode 'full'`

## Ejecutar los nodos
`geth --datadir node --syncmode 'full' --gcmode=archive   --port 40605 --http --http.port 3545 --http.api 'personal,eth,net,web3,personal,admin,miner,txpool,debug' --bootnodes enode://762d3b62342a9d0ccec763ea2564d2e2c95522860b074c354d9c4e198cf8fcc601ce6ab993c9f66278879a8ba6331b0ab32bf85dd1c9b68588c061b81321dcf1@185.249.227.141:0?discport=40606 --networkid 65450 --allow-insecure-unlock`

para Parar la red escribimos Ctrl D o Ctrl C

de esta forma podras ejecutar un nodo pero si quieres una consola de escritura te recomendamos primero ponerlos en un screen

## Instalamos
`apt install screen`

## Creamos Scol
`screen –S scol`

Si queremos salir de screen Ctrl A y D 

Para volver a iniciar `Screen –r scol` con esto ingresamos

En este screen ponemos la siguiente instrucción:
`geth --datadir node --syncmode 'full' --gcmode=archive   --port 40605 --http --http.port 3545 --http.api 'personal,eth,net,web3,personal,admin,miner,txpool,debug' --bootnodes enode://762d3b62342a9d0ccec763ea2564d2e2c95522860b074c354d9c4e198cf8fcc601ce6ab993c9f66278879a8ba6331b0ab32bf85dd1c9b68588c061b81321dcf1@185.249.227.141:0?discport=40606 --networkid 65450 --allow-insecure-unlock console 2>> /null`

`admin.addPeer("enode://762d3b62342a9d0ccec763ea2564d2e2c95522860b074c354d9c4e198cf8fcc601ce6ab993c9f66278879a8ba6331b0ab32bf85dd1c9b68588c061b81321dcf1@185.249.227.141:40605")`

`admin.addPeer("enode://61e6985d70174a9e0c0da9fb9646ca85575e9cfcb27b169b918d38c854308f9087413c07dcd3c13ca984fde74bbc8f8755b262af7f042242c57a99572acf6d23@185.249.227.142:40605")`



## Podras usar los siguientes comandos:

- `geth attach http://localhost:3545`  > ingresar a la consola

- `net.peerCount` > cuentas Peer conectadas

- `admin.peers` > pares conectados

- `eth.blockNumber` > Numero de Bloques

- `eth.accounts` > cantidad de Direcciones

- `personal.newAccount()` > Crea una nueva direccion

- `eth.getBalance(eth.accounts[0])` > Obtener balance de la dirección 1

- `eth.sendTransaction({from:"origen",to:"destino",value: web3.toWei(1, "ether") })` > enviar

- `eth.getBalance("0x20dCB6478825b9DA96c543453bCec2B945e9FB88")` > obtener balance

para salir del screen Ctrl A y D

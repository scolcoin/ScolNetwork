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


## Instalamos el geth:

`chmod 777 geth`

`sudo mv geth /usr/local/bin/`

## Inicializar el nodo

`geth --datadir ./node init scol_mainnet.json`


## Ejecutar los nodos
`geth --datadir node --syncmode 'full' --gcmode=archive   --port 40605 --http --http.port 3545 --http.api 'personal,eth,net,web3,personal,admin,miner,txpool,debug' --bootnodes enode://77f7dbb542cc7278d4a8bcb70cf142da58fe796aa7a9092908ac4481ce76079a5404e83bc0460cbf0278f9662d3593136a3a906ceb517d6e11c84222e1ebaecc@185.249.227.141:0?discport=40606 --networkid 65450 --allow-insecure-unlock`

para Parar la red escribimos Ctrl D o Ctrl C

de esta forma podras ejecutar un nodo pero si quieres una consola de escritura te recomendamos primero ponerlos en un screen

## Instalamos
`apt install screen`

## Creamos Scol
`screen –S scol`

Si queremos salir de screen Ctrl A y D 

Para volver a iniciar `Screen –r scol` con esto ingresamos

En este screen ponemos la siguiente instrucción:
`geth --datadir node --syncmode 'full' --gcmode=archive   --port 40605 --http --http.port 3545 --http.api 'personal,eth,net,web3,personal,admin,miner,txpool,debug' --bootnodes enode://77f7dbb542cc7278d4a8bcb70cf142da58fe796aa7a9092908ac4481ce76079a5404e83bc0460cbf0278f9662d3593136a3a906ceb517d6e11c84222e1ebaecc@185.249.227.141:0?discport=40606 --networkid 65450 --allow-insecure-unlock console 2>> /null`

`admin.addPeer("enode://844800ade2bf4fd5565d135c4ed3c1cc71148c6a686625ab6eb17d943de40356475b8799db887f6009fd392000fc51f76295e94a1323edba8ed95c407dba38f9@185.249.227.141:40605")`
`admin.addPeer("enode://6d114dfd64c7e2bcacde985a97ef0dac80f636d29a109089d4ca4779be13e3b074132e1476d08c46f93f7c369b0571e93fb22050f73d3eb351c398b353c5491a@185.249.227.142:40605")`
`admin.addPeer("enode://f8c6122dad8432b400cac53d4e68dd0ac70bd0d0a7c155bee01884cbc8d1a1ad03cb4cbe02c6102c6678c5223e119b4ff9fea49e7f3995ba63563f973614794a@127.0.0.1:40605")`
`admin.addPeer("enode://84d31a16c3edd2965dd31fe821c60d8c3834fb72757bed22ca56d9f4d76357a775d908dfcdf068b9f66307a53834883ca77f6f1a5a073dfc1bb0e347a0c0f7e2@127.0.0.1:40605")`
`admin.addPeer("enode://e25dc38313a3996bafc51dbaf744633f4416b6f8880a0b9d8c7ee4350caa97a0aa5799e8b44f140eb5a67d5761d80a400081e30f5b77f7b9a881e9a7ea309a81@127.0.0.1:40605")`
`admin.addPeer("enode://e1eb3bda11eb22c1e4fd1443db1f76e8e4aef3238aab59629706743de720b8d7388b619aff9455a3292f2f11fe4e8967f137380d59d1b507ec740c4b60495784@127.0.0.1:40605")`
`admin.addPeer("enode://819bcb45baffd66b50fba35d848d4b6553d29773cfe47185968248f91e9eaa9c7c5533b3d1e2202be47f09a6e12d5af46883f0eb00b45c5104a7e75b6c6cc6c0@127.0.0.1:40605")`

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

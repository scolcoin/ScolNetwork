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
`Screen –S scol`

Si queremos salir de screen Ctrl A y D 

Para volver a iniciar `Screen –r scol` con esto ingresamos

En este screen ponemos la siguiente instrucción:
`geth --datadir node --syncmode 'full' --gcmode=archive   --port 40605 --http --http.port 3545 --http.api 'personal,eth,net,web3,personal,admin,miner,txpool,debug' --bootnodes enode://77f7dbb542cc7278d4a8bcb70cf142da58fe796aa7a9092908ac4481ce76079a5404e83bc0460cbf0278f9662d3593136a3a906ceb517d6e11c84222e1ebaecc@185.249.227.141:0?discport=40606 --networkid 65450 --allow-insecure-unlock console 2>> /null`

`admin.addPeer("enode://844800ade2bf4fd5565d135c4ed3c1cc71148c6a686625ab6eb17d943de40356475b8799db887f6009fd392000fc51f76295e94a1323edba8ed95c407dba38f9@185.249.227.141:40605")`

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

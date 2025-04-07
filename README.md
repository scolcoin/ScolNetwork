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
`wget https://raw.githubusercontent.com/scolcoin/ScolNetwork/master/genesis.json`

`wget https://raw.githubusercontent.com/scolcoin/ScolNetwork/master/geth` 

## Instalamos script auto:
`wget https://raw.githubusercontent.com/scolcoin/ScolNetwork/master/add-peer.sh` 

## Instalamos el geth:

`chmod 777 geth`

`chmod 777 add-peer.sh`

`sudo mv geth /usr/local/bin/`

## Inicializar el nodo

`geth --datadir ./node init genesis.json`

## Programamos los nodos
crontab -e
@reboot /root/src/add-peer.sh

## Ejecutar los nodos
`geth --datadir node --syncmode 'full' --gcmode=archive   --port 40605 --http --http.port 3545 --http.api 'personal,eth,net,web3,personal,admin,miner,txpool,debug' --bootnodes enode://3b364882fed8024c4436649b43718afc9575dc8907f038c61ebb51cc8aadcfd76e846fc23d98a812a6542a01b486c26caadeaf2179a3923dcb61e19f9a6de6ab@84.247.128.187:40605 --networkid 65450 --allow-insecure-unlock`

para Parar la red escribimos Ctrl D o Ctrl C

de esta forma podras ejecutar un nodo pero si quieres una consola de escritura te recomendamos primero ponerlos en un screen

## Instalar Node.js y npm
`curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g pm2
pm2 startup`

## Creamos Scol
`screen –S scol`

Si queremos salir de screen Ctrl A y D 

Para volver a iniciar `Screen –r scol` con esto ingresamos

En este screen ponemos la siguiente instrucción:
`geth --datadir node --syncmode 'full' --gcmode=archive   --port 40605 --http --http.port 3545 --http.api 'personal,eth,net,web3,personal,admin,miner,txpool,debug' --bootnodes enode://3b364882fed8024c4436649b43718afc9575dc8907f038c61ebb51cc8aadcfd76e846fc23d98a812a6542a01b486c26caadeaf2179a3923dcb61e19f9a6de6ab@84.247.128.187:40605 --networkid 65450 --allow-insecure-unlock console 2>> /null`




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

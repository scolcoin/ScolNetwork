# ScolNetwork 2025

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

# Linux 32

# Linux 64

En tu VPS en Home Crear carpeta de nodos
* Permisos:

`sudo ufw allow 30303/tcp`

`sudo ufw allow 30303/udp`

* Crea Carpetas:
  
mkdir -p /var/lib/geth-scol /etc/geth-scol

## Descargue geth:

`wget http://scolcoin.com/i/geth-linux64-bit-amd64-Scol.tar.gz`

`sudo tar xzf geth-linux64-bit-amd64-Scol.tar.gz`

## Instalamos

`cd geth-linux-amd64-1.13.15-c5ba367e`

`sudo install -m 0755 geth /usr/local/bin/geth`

`geth version` 

## Instalamos el genesis:

`cd /etc/geth-scol`

`wget http://scolcoin.com/i/genesis.json`

## Inicializar el nodo

`geth init --datadir /var/lib/geth-scol /etc/geth-scol/genesis.json`

## Permisos y usuario
`sudo useradd --system --home /var/lib/geth-scol --shell /usr/sbin/nologin geth
sudo chown -R geth:geth /var/lib/geth-scol
sudo chown -R root:root /etc/geth-scol
sudo find /var/lib/geth-scol -type d -exec chmod 0750 {} \;
sudo find /var/lib/geth-scol -type f -exec chmod 0640 {} \;
sudo chown geth:geth /var/lib/geth-scol
chown -R geth:geth /var/lib/geth-scol`

## Prueba de funcionamiento del Geth con nuestra red:


## Creamos entorno de Sistema

`sudo -u geth /usr/local/bin/geth \
  --datadir /var/lib/geth-scol \
  --bootnodes "enode://ec679eec262a5e3fe93ae01aaa4640966808cc63fe911264288958db885976aa4cdd981506764e65ebb69d485de83225dcfa813d25de7ae727af44b9d78553cf@185.249.227.142:30303,enode://32ec33aca4244aca2b3bd78e5c14c417f3b2450568292dd65ce0520fc22286b9cf32822db5df2eba4f99477035d01c2f385a7bcf02f3ad81485a507386eba793@158.220.118.217:30303,enode://b463e4fbe3b3e4f4a3fcd5486dbaf6f23ba7e3ddc716544f476be17bf050852fecdd4fba36be509342e75000d99ec34fbbf3903f857e95731e734295722b5812@38.242.226.154:30303,enode://a704d85710ee8ff98fe7564c45aea407265cb1a1c29fa8237f3be3603c12c438217400132e6917952afb70159e7317834ef144516a582d2c3540f6cae0379673@2.59.156.157:30303,enode://ee0b8e1addd6963b1d6650c07401f51a3b3f1b0aa3939605905722460266531a367582002b1ccc9c04198c6f0eaf3aea732f587ef8ddb38004a0659bb87b59f7@213.199.45.11:30303" \
  --networkid 65450 \
  --port 30303 \
  --http --http.addr 127.0.0.1 --http.port 8545 \
  --http.api eth,net,web3,admin,clique,txpool,personal \
  --allow-insecure-unlock \
  --syncmode full --gcmode full \
  --verbosity 3
`

para Parar la red escribimos Ctrl D o Ctrl C

de esta forma podras ejecutar un nodo pero si quieres una consola de escritura te recomendamos primero ponerlos en un screen

## Instalar Node.js y npm
`curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -`

`sudo apt-get install -y nodejs`

`sudo npm install -g pm2`

`pm2 startup`

## Creamos Scol

En este screen ponemos la siguiente instrucción:
`pm2 start "geth --datadir node --syncmode 'full' --gcmode=archive   --port 40605 --http --http.port 3545 --http.api 'personal,eth,net,web3,personal,admin,miner,txpool,debug' --bootnodes enode://3b364882fed8024c4436649b43718afc9575dc8907f038c61ebb51cc8aadcfd76e846fc23d98a812a6542a01b486c26caadeaf2179a3923dcb61e19f9a6de6ab@84.247.128.187:40605 --networkid 65450 --allow-insecure-unlock" --name "start-node4" -- start`


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

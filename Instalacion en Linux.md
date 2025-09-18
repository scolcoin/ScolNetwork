# Instalacion en Sistema Operativo LINUX
En tu VPS en Home Crear carpeta de nodos
* Permisos:

`sudo ufw allow 30303/tcp`

`sudo ufw allow 30303/udp`

* Crea Carpetas:
  
mkdir -p /var/lib/geth-scol /etc/geth-scol

## Descargue geth en linux 64:

`wget http://scolcoin.com/i/geth-linux64-bit-amd64-Scol.tar.gz`

`sudo tar xzf geth-linux64-bit-amd64-Scol.tar.gz`

`cd geth-linux-amd64-1.13.15-c5ba367e`

`sudo install -m 0755 geth /usr/local/bin/geth`

`geth version` 

# o Descargue geth en Linux 32:

`wget http://scolcoin.com/i/geth-linux32-bit-386-Scol.tar.gz`

`sudo tar xzf geth-linux32-bit-386-Scol.tar.gz`

`cd geth-linux-386-1.13.15-c5ba367e`

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

`
sudo -u geth /usr/local/bin/geth \
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

## Creamos entorno de Sistema

`nano /etc/systemd/system/geth-scol.service`


[Unit]
Description=Geth (SCOL Execution Layer)
After=network-online.target
Wants=network-online.target

[Service]
User=geth
Group=geth
Type=simple
LimitNOFILE=65536
WorkingDirectory= --datadir /var/lib/geth-scol 
ExecStart=/usr/local/bin/geth \
  --networkid 65450 \
  --port 30303 \
  --http --http.addr 127.0.0.1 --http.port 8545 \
  --http.api eth,net,web3,admin,clique,txpool,personal \
  --allow-insecure-unlock \
  --syncmode full --gcmode full \
  --bootnodes "enode://ec679eec262a5e3fe93ae01aaa4640966808cc63fe911264288958db885976aa4cdd981506764e65ebb69d485de83225dcfa813d25de7ae727af44b9d78553cf@185.249.227.142:30303,enode://32ec33aca4244aca2b3bd78e5c14c417f3b2450568292dd65ce0520fc22286b9cf32822db5df2eba4f99477035d01c2f385a7bcf02f3ad81485a507386eba793@158.220.118.217:30303,enode://b463e4fbe3b3e4f4a3fcd5486dbaf6f23ba7e3ddc716544f476be17bf050852fecdd4fba36be509342e75000d99ec34fbbf3903f857e95731e734295722b5812@38.242.226.154:30303,enode://a704d85710ee8ff98fe7564c45aea407265cb1a1c29fa8237f3be3603c12c438217400132e6917952afb70159e7317834ef144516a582d2c3540f6cae0379673@2.59.156.157:30303,enode://ee0b8e1addd6963b1d6650c07401f51a3b3f1b0aa3939605905722460266531a367582002b1ccc9c04198c6f0eaf3aea732f587ef8ddb38004a0659bb87b59f7@213.199.45.11:30303" \
  --verbosity 3

Restart=always

RestartSec=5

StandardOutput=journal

StandardError=journal

[Install]
WantedBy=multi-user.target

para grabar Ctrl X y le ponemos la letra Y enter para almacenar

* Iniciamos:

`sudo systemctl daemon-reload`

`sudo systemctl enable --now geth-scol.service`

`journalctl -u geth-scol -f `

Ctrl C para salir del geth del sistema queda automatico en su servidor.


## Podras usar los siguientes comandos:

- `geth attach http://localhost:8545`  > ingresar a la consola

- `net.peerCount` > cuentas Peer conectadas

- `admin.peers` > pares conectados

- `eth.blockNumber` > Numero de Bloques

- `eth.accounts` > cantidad de Direcciones

- `personal.newAccount()` > Crea una nueva direccion

- `eth.getBalance(eth.accounts[0])` > Obtener balance de la dirección 1

- `eth.sendTransaction({from:"origen",to:"destino",value: web3.toWei(1, "ether") })` > enviar

- `eth.getBalance("0x20dCB6478825b9DA96c543453bCec2B945e9FB88")` > obtener balance

para salir de la consola Ctrl C

# Otras Distribuciones de Linux:

### Arm5
`wget http://scolcoin.com/i/geth-linux-arm5-Scol.tar.gz`

### Arm6
`wget http://scolcoin.com/i/geth-linux-arm6-Scol.tar.gz`

### Arm7
`wget http://scolcoin.com/i/geth-linux-arm7-Scol.tar.gz`

### Arm64
`wget http://scolcoin.com/i/geth-linux-arm64-Scol.tar.gz`

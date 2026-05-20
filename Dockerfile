FROM node:18-alpine

# Instala o Mosquitto (broker MQTT)
RUN apk add --no-cache mosquitto

# Cria pasta do app
WORKDIR /app

# Copia os arquivos
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf
COPY dashboard.html ./dashboard.html

# Instala servidor HTTP simples
RUN npm install -g http-server

# Script de inicialização
COPY start.sh ./start.sh
RUN chmod +x ./start.sh

EXPOSE 1883
EXPOSE 9001
EXPOSE 8080

CMD ["./start.sh"]

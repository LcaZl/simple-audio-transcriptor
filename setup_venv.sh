#!/bin/bash

# Nome dell'ambiente
ENV_NAME="whisper_env"

# Crea e attiva ambiente virtuale
python3 -m venv $ENV_NAME
source $ENV_NAME/bin/activate

# Installa FFmpeg se manca
if ! command -v ffmpeg &> /dev/null; then
    echo "FFmpeg non trovato. Lo installo..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install ffmpeg
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt update && sudo apt install ffmpeg -y
    else
        echo "Sistema non riconosciuto per l'installazione automatica di FFmpeg."
        exit 1
    fi
fi

# Installa dipendenze Python
pip install --upgrade pip
pip install -r requirements.txt

echo ""
echo "Installazione completata!"
echo "Per attivare l'ambiente:"
echo "  source $ENV_NAME/bin/activate"
echo "Per avviare Jupyter Notebook:"
echo "  jupyter notebook"
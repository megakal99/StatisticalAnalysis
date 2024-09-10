# Utiliser l'image officielle de Python 3.12 comme base
FROM python:3.12-slim

# D�finir le r�pertoire de travail dans le conteneur
WORKDIR /Sanalam_Stats_APP

# Copier le fichier de d�pendances dans le conteneur
COPY requirements.txt .

# Installer les d�pendances
RUN pip install --no-cache-dir -r requirements.txt

# Copier le reste des fichiers de l'application dans le conteneur
COPY . .

# Exposer le port que Streamlit utilise (par d�faut 8501)
EXPOSE 8501

# D�finir la commande par d�faut pour lancer Streamlit avec les param�tres appropri�s (--server.address=0.0.0.0 pour �couter sur toutes les interfaces r�seau. Cela permet � l'application d'�tre accessible depuis n'importe quelle adresse IP)
CMD ["streamlit", "run", "Introduction.py", "--server.address=0.0.0.0", "--server.port=8501"]
                                                 
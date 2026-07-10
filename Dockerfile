FROM python:3.10-slim

# Instalacja zależności systemowych dla PostgreSQL
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Klonowanie repozytorium bezpośrednio w kontenerze
RUN apt-get update && apt-get install -y git && \
    git clone https://github.com/Matiorus/Django-build.git . && \
    apt-get purge -y --auto-remove git && \
    rm -rf /var/lib/apt/lists/*

# Instalacja bibliotek Pythona
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir psycopg2-binary

# Uruchomienie serwera Django (domyślnie na SQLite, chyba że podasz zmienne środowiskowe)
CMD ["python", "mysite/manage.py", "runserver", "0.0.0.0:8000"]

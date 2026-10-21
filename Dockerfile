# Imagen base oficial de Python
FROM python:3.13-slim

# Directorio de trabajo
WORKDIR /app

# Dependencias del sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copiar e instalar dependencias de Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código del proyecto
COPY . .

# Exponer el puerto de Django
EXPOSE 8000

# Comando para arrancar el servidor
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
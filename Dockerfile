# Usa una imagen base de Python en Linux
FROM python:3.10

# Establece el directorio de trabajo
WORKDIR /app

# Copia el código local al contenedor
COPY . /app

# Instala Tesseract OCR y sus dependencias en Linux
RUN apt-get update && apt-get install -y tesseract-ocr


RUN pip install gunicorn

# Instala el paquete Python pytesseract
RUN pip install pytesseract

# Instala otras dependencias de Python si es necesario
RUN pip install -r requirements.txt

# Establece el comando para ejecutar tu aplicación
#CMD [ "python", "src/ocr-prueba.py" ]

CMD ["gunicorn", "-b", "0.0.0.0:4000", "src.ocr-prueba:app"]

# Establece la entrada principal que inicia tu aplicación
#ENTRYPOINT ["python", "src/ocr-prueba.py"]
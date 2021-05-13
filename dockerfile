FROM python:3.8-alpine
RUN pip install flask
CMD ["python","lilapp.py"]
COPY lilapp.py /lilapp.py
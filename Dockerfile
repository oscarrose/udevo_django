FROM python:3.8-alpine
ENV PYTHONUNBUFFERED=1

RUN mkdir /app
WORKDIR /app

COPY Pipfile /Pipfile
RUN pip3 install --upgrade pip && pip3 install --no-cache pipenv
RUN pipenv install --skip-lock --system --dev

COPY . /app

RUN adduser -D user
USER user
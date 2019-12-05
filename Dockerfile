FROM python:3.7.4-alpine3.10

RUN apk add --no-cache build-base gcc

WORKDIR /app/

RUN pip install virtualenv

RUN virtualenv venv

COPY ./requirements.txt ./

RUN pip install -r requirements.txt

COPY . /app/


# we have to wait even after wait-for.sh
# because neo4j doesn't work when it starts listening to a port
CMD echo "Waiting for $NEO4J_HOST:$NEO4J_PORT..." && \
    /app/wait-for.sh -t 60 $NEO4J_HOST:$NEO4J_PORT && \
    sleep 15 && \
    python run.py
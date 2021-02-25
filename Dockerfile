FROM alpine:latest

WORKDIR /app
EXPOSE 3333
EXPOSE 8332

RUN apk add --no-cache \
	build-base \
	git \
	python-dev
	
RUN apk add --update libressl-dev

COPY . ./
RUN python distribute_setup.py && \
	python setup.py develop

ENTRYPOINT ["./mining_proxy.py"]

FROM alpine:latest

WORKDIR /app
EXPOSE 3333
EXPOSE 8332

RUN apk add --update \
	build-base \
	git \
	python2-dev \
	pip 
	

COPY . ./
RUN python distribute_setup.py && \
	python setup.py develop

ENTRYPOINT ["./mining_proxy.py"]

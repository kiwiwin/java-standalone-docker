#java-standalone-docker-template

java standalone dockerfile generator

##Base Image

anapsix/alpine-java:8

##Generate Dockerfile

generate dockerfile:

	gen.sh <path/to/app.jar> <app.main.class> [target_directory]

will create a Dockerfile, then you can create a docker image:

	docker build -t <app>:<tag>	

##Run with Auto Generated Property Files by Environment Variables

convention:

	APP_<FILENAME>_PROPS_<KEY>=<VALUE>
	
run built image will generate a config file under the root of classpath:

	name: <FILENAME>
	<KEY>=<VALUE>

##Examples

###prop-reader

1. generate Dockerfile

	./gen.sh examples/archives/original.jar org.kiwi.prop.reader.PropReader examples/prop-reader

2. build image

	cd examples/prop-reader
	docker build -t "kiwiwin/prop-reader"

3. run
	
	docker run -it -e APP_REDIS_PROPS_REDIS_HOST=localhost -e APP_REDIS_PROPS_REDIS_PORT=6379 kiwiwin/prop-reader redis.properties redis.host redis.port

output:

	filename: redis.properties
	redis.host=localhost
	redis.port=6379	


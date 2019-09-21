all: build run

build:
	docker build -t hbouvier/hive .

run:
	cat README.md
	docker run --name hive -ti -d -p 10000 hbouvier/hive


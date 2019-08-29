all: render start
.PHONY: render start clean tar dist
render:
	docker run --rm -v $(PWD):/workdir futuretea/render render --indir templates --outdir . --config config.yaml --set dev=yes --unsafe-ignore-missing-keys
start:
	goreman -f ProcFile start
dist: clean tar
clean:
	rm -f forwarder.tar.gz
	rm -f ProcFile
tar:
	tar -zcvf forwarder.tar.gz .

	
.PHONY: requirements.txt

server:
	cd web && mix phoenix.server

run: env/bin/jupyter
	$< notebook

IElixir:
	test -d .ielixir || git clone https://github.com/pprzetacznik/IElixir .ielixir
	cd .ielixir && mix deps.get
	cd .ielixir && mix test
	cd .ielixir && MIX_ENV=prod mix compile

env/bin/jupyter: requirements.txt

requirements.txt: env/bin/pip
	$< install -r $@

env/bin/pip: env/bin

env/bin:
	virtualenv -p python3 env

clean:
	rm -rf env
	mkdir -p env

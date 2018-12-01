#goods.beam : goods.erl
#	erlc  goods.erl
#
.SUFFIXES: .erl .beam

.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean
Mods = goods shop aflie_client
all: compile
	#${ERL} -pa '/home/wm/code/erlang' -s goods cost
	echo ${ERL}
compile: ${Mods:%=%.beam}

clean:
	rm -rf *.beam erl_crash.dump

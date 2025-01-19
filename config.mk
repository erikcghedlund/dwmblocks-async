CFLAGS   = -DWEATHERCMD="\"$(realpath ./scripts/dwmblocks-weather.sh)\"" -DUPDATESCMD="\"$(realpath ./scripts/updates.sh)\""  -DSTATSCMD="\"$(realpath ./scripts/dwmblocks-stats.sh)\""

# Solaris
#CFLAGS = -fast ${INCS} -DVERSION=\"${VERSION}\"
#LDFLAGS = ${LIBS}

# compiler and linker
CC = cc

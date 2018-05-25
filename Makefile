
FORTRAN=mpif90
FLAGS=-i4 -r8 -O2 -assume byterecl -o lesmpi.a
SWAP_FLAGS = -convert big_endian -DSWAP
DEBUG_FLAGS=-g -traceback -check all
INCLUDE=-I~/Research/byte
OFILES=~/Research/byte/module_byteswap.o ~/Research/fft/fft_64.o

all: les.F
	$(FORTRAN) $(FLAGS) $(INCLUDE) les.F $(OFILES)

byteswap: les.F
	$(FORTRAN) $(FLAGS) $(SWAP_FLAGS) $(INCLUDE) les.F $(OFILES)

pgi: les.F
	mpipf90 -i4 -r8 -byteswapio -fast -Minline=rlim -DSWAP -o lesmpi.a -I/glade/u/home/drichter/byte_pgi /glade/u/home/drichter/byte_pgi/module_byteswap.o /glade/u/home/drichter/fft_pgi/fft_64.o les.F

debug: les.F
	$(FORTRAN) $(FLAGS) $(DEBUG_FLAGS) $(INCLUDE) les.F $(OFILES)

clean:
	rm -f *.o *.mod lesmpi.a mach.file *.*~ wav*

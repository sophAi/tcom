PROG =	bin/tcom.out

#SRCS =

OBJS=src/tcom_f77.o src/parallel_f77.o src/file_f77.o src/startend_f77.o src/tcf_assignment_f77.o src/tcf_moment_zeta_f77.o src/tcf_output_f77.o

LIBS =
FC = mpif77
LDFLAGS= 
RUNCPP = 
#cpp -P -C

#Intel Fortran 32/64-bit SSE3===========
#FFLAGS=-O2 -axSSE3 -unroll-aggressive -ipo -no-prec-div -limf
#====================================
#intel Fortran 32/64-bit SSE2===========
#FFLAGS=-O2 -axSSE2 -unroll-aggressive -ipo -no-prec-div -limf 
#====================================
#gfortran============================
FFLAGS=-march=native -mfpmath='sse' -msse2 -ffast-math -funroll-loops -O3
#====================================
#g95=================================
#FFLAGS=-march=nocona -ffast-math -funroll-loops -O3
#====================================
#PGI Fortran safe for mpif77=========
#This is safe option,use this when debugging or writing new codes
#FFLAGS=-i4 -O3 -r8 -Mnoscalarsse -pc=80
#====================================
#PGI Fortran medium for mpif77=======
#This is fast option with sse,please use it when safe option is passed
# FFLAGS=-O2 -fastsse -Mipa=fast
#====================================
#PGI Fortran fast for mpif77=========
#Full power
#FFLAGS=-O3 -fastsse -Mipa=fast -Minfo -r8 -i4 -tp=amd64 -Mflushz -Munroll
#====================================
# g77 pentium 32bit==================
#FFLAGS=-O6 -ffixed-line-length-132 \
   -fno-f2c -fautomatic -ffast-math \
          -fstrength-reduce -fexpensive-optimizations -fcaller-saves \
          -funroll-loops -finline-functions -march=pentium
#====================================
# PGI Fortran with mpif90============
# Copied from some examples. Further test should be done. Please use it carefully.
# FFLAGS=-r8 -fast -mcmodel=medium -Mscalarsse -Mcache_align -Mflushz -w
#====================================
# g77 AMD64==========================
#  FFLAGS=-O6 -m64 -ffixed-line-length-132 \
   -fno-f2c -fautomatic -fforce-mem -ffast-math \
          -fstrength-reduce -fexpensive-optimizations -fcaller-saves \
          -funroll-loops -finline-functions
#====================================

all: $(PROG)

$(PROG): $(OBJS) $(EXTRAS)
	$(FC) $(FFLAGS) $(LDFLAGS) -o $@ $(OBJS) $(EXTRAS) $(LIBS) 


clean:
	rm -f src/*.o*

C/* ----------------------------------------------------------------------
C   TCOM - TCF calculation on MPICH
C
C   This software is distributed under the GNU General Public License. 
C   See the README file in the top-level directory.
C-------------------------------------------------------------------------
C   | File Name : tcom_f77.h
C   | Creation Time : 2012-11-09 14:30:50
C   | Last Modified : 2012-11-13 15:18:25
C------------------------------------------------------------------------- */
       integer I0,I1,I2,I3,I4,I5,I6,I7,I8,I9
       integer J0,J1,J2,J3,J4,J5,J6,J7,J8,J9
       integer nproc,myid,mpi_err
       logical wscreen,debug
       common nproc,myid,wscreen,debug
       integer window_step_max
       parameter(window_step_max=1000000)
       integer start_point,end_point,print_step,window_step_num,
     &total_data_num
       common /tcom_int0/ start_point,end_point,window_step_num,
     &print_step,total_data_num
       real*8 time_per_step,time_label
       common /tcom_real0/ time_per_step,time_label
       integer par_num_max
       parameter(par_num_max=100)
       real*8 tcf
       common /tcom_real1/ tcf

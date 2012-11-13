C/* ----------------------------------------------------------------------
C   TCOM - TCF calculation on MPICH
C
C   This software is distributed under the GNU General Public License. 
C   See the README file in the top-level directory.
C-------------------------------------------------------------------------
C   | File Name : mom_f77.h
C   | Creation Time : 2012-11-09 14:30:50
C   | Last Modified : 2012-11-13 15:17:50
C------------------------------------------------------------------------- */
       real*8 time(window_step_max),frame(window_step_max)
       real*8 mom1(window_step_max),mom2(window_step_max),
     &mom3(window_step_max),mom4(window_step_max),
     &mom5(window_step_max),mom6(window_step_max),
     &mom7(window_step_max),mom8(window_step_max),
     &mom9(window_step_max),mom10(window_step_max),
     &mom11(window_step_max),mom12(window_step_max),
     &mom13(window_step_max),mom14(window_step_max),
     &mom15(window_step_max),mom16(window_step_max)
       common/mom_real0/ time,frame,mom1,mom2,mom3,
     &mom4,mom5,mom6,mom7,mom8,mom9,mom10,mom11,
     &mom12,mom13,mom14,mom15,mom16

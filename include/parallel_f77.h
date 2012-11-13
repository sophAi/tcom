C/* ----------------------------------------------------------------------
C   TCOM - TCF calculation on MPICH
C
C   This software is distributed under the GNU General Public License. 
C   See the README file in the top-level directory.
C-------------------------------------------------------------------------
C   | File Name : parallel_f77.h
C   | Creation Time : 2012-11-09 14:30:50
C   | Last Modified : 2012-11-13 15:18:16
C------------------------------------------------------------------------- */
       integer node,ist1,iend1
       integer length(window_step_max)
    
       integer parallel_id,job_point_id
       common /parallel_shell0/parallel_id,job_point_id

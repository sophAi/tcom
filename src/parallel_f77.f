* -----------------------------------------------------------------------
*  TCOM - TCF Calculation on MPICH
*  
*  This software is distributed under the GNU General Public License.
*  See the README file in the top-level directory.
* -----------------------------------------------------------------------
*  | File Name : parallel_f77.f
*  | Creation Time : 
*  | Last Modified : 2012-11-13 15:16:37
* -----------------------------------------------------------------------
       subroutine parallel_f77()
       implicit none
       include "mpif.h"
       include "../include/tcom_f77.h"
       include "../include/parallel_f77.h"
       include "../include/file_f77.h"
       integer window_step_num_input
       window_step_num_input=window_step_num
       do J0=0,nproc-1
         call startend_f77(J0,nproc,1,window_step_num_input,ist1,iend1)
C         start_point(J0)=ist1-1       !from 1,total_job_num,ist1*myid*(ndim)-2=start point of N dim 
C Be careful! ist1-1 is only for MPI_SCATTERV,MPI_GATHERV
         length(J0)=iend1-ist1+1   
       enddo
       do parallel_id=1,length(myid)
         job_point_id=1+myid+(parallel_id-1)*nproc  
C         write(*,*)myid,"job_point=",job_point_id
         call tcf_assignment_f77
         call tcf_output_f77
       enddo
99     call mpi_barrier(mpi_comm_world,mpi_err)
       return
       end

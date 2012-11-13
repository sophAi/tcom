* -----------------------------------------------------------------------
*  TCOM - TCF calculation on MPICH
*
*  This software is distributed under the GNU General Public License.
*  See the README file in the top-level sophAi directory.
* -----------------------------------------------------------------------
*  | File Name : tcom_f77.f
*  | Creation Time : 2012-11-09 14:23:26
*  | Last Modified : Mon 12 Nov 2012 01:57:58 PM CST
* -----------------------------------------------------------------------

       program tcom_f77   !initialized the MPI environment
       implicit none
       include "mpif.h"
       include "../include/tcom_f77.h"
       call mpi_init(mpi_err)
       call mpi_comm_size(mpi_comm_world,nproc,mpi_err)
       call mpi_comm_rank(mpi_comm_world,myid,mpi_err)
C====================main code========================
       call file_f77
       call read_file_f77
       call parallel_f77
C====================End==============================
       call mpi_finalize(mpi_err)
       stop
       end



* -----------------------------------------------------------------------
*  TCOM - TCF Calculation on MPICH
*
*  This software is distributed under the GNU General Public License.
*  See the README file in the top-level directory.
* -----------------------------------------------------------------------
*  | File Name : tcf_output_f77.f
*  | Creation Time : 
*  | Last Modified : 2012-11-13 15:17:18
* -----------------------------------------------------------------------

      subroutine tcf_output_f77()
      implicit none
      include "../include/tcom_f77.h"
      include "../include/file_f77.h"
      include "../include/parallel_f77.h"
      logical file_exist,write_finish
      write_finish=.false.
100   inquire(file="unlock",exist=file_exist)
      if(file_exist)then               ! if the status is unlock, proceed.
        call rename("unlock","lock")   ! lock. To prevent two processes output the results to a file at the same time. 
        open(21,file=output_file_name,access="append")
        write(21,*) dble(job_point_id)*time_per_step,tcf    ! real time(ps), tcf
        close(21)
        write_finish=.true.
        call rename("lock","unlock")   !unlock
      endif
      if(.not.write_finish)then       ! if lock, wait until it unlock.
        call sleep(1)
        goto 100
      endif
      return
      end

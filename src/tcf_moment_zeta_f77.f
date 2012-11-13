* -----------------------------------------------------------------------
*  TCOM - TCF calculation on MPICH
*
*  This software is distributed under the GNU General Public License.
*  See the README file in the top-level sophAi directory.
* -----------------------------------------------------------------------
*  | File Name : tcf_moment_zeta_f77.f
*  | Creation Time : 
*  | Last Modified : Mon 12 Nov 2012 01:52:36 PM CST
* -----------------------------------------------------------------------

      subroutine tcf_moment_zeta_f77()
      implicit none
      include "../include/tcom_f77.h"
      include "../include/file_f77.h"
      include "../include/mom_f77.h"
      include "../include/parallel_f77.h"
      integer tcf_length
      real*8 tcf_temp
      tcf=0.D0
      tcf_temp=0.D0
      tcf_length=total_data_num-job_point_id
      do I0=1,tcf_length
        tcf_temp=dabs(mom1(I0)-mom1(I0+job_point_id))+
     &dabs(mom2(I0)-mom2(I0+job_point_id))+
     &dabs(mom3(I0)-mom3(I0+job_point_id))+
     &dabs(mom4(I0)-mom4(I0+job_point_id))+
     &dabs(mom5(I0)-mom5(I0+job_point_id))+
     &dabs(mom6(I0)-mom6(I0+job_point_id))+
     ^dabs(mom7(I0)-mom7(I0+job_point_id))+
     &dabs(mom8(I0)-mom8(I0+job_point_id))+
     &dabs(mom9(I0)-mom9(I0+job_point_id))+
     &dabs(mom10(I0)-mom10(I0+job_point_id))+
     &dabs(mom11(I0)-mom11(I0+job_point_id))+
     &dabs(mom12(I0)-mom12(I0+job_point_id))+
     &dabs(mom13(I0)-mom13(I0+job_point_id))+
     &dabs(mom14(I0)-mom14(I0+job_point_id))+
     &dabs(mom15(I0)-mom15(I0+job_point_id))+
     &dabs(mom16(I0)-mom16(I0+job_point_id))
        tcf_temp=1.D0/(1.D0+tcf_temp/16.D0)
        tcf=tcf+tcf_temp
      enddo
      tcf=tcf/dble(tcf_length)
      write(*,*) myid,job_point_id,"tcf=",tcf
      return
      end

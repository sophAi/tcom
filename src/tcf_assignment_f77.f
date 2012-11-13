* -----------------------------------------------------------------------
*  TCOM - TCF Calculation on MPICH
*
*  This software is distributed under the GNU General Public License.
*  See the README file in the top-level sophAi directory.
* -----------------------------------------------------------------------
*  | File Name : tcf_assigment_f77.f
*  | Creation Time : 
*  | Last Modified : Mon 12 Nov 2012 01:28:47 PM CST
* -----------------------------------------------------------------------

      subroutine tcf_assignment_f77()
      implicit none
      include "../include/tcom_f77.h"
      include "../include/file_f77.h"
      if(file_type.eq."mom")then
        call tcf_moment_zeta_f77
      endif
C-----New calculation can be inserted here------------------
   
      return
      end

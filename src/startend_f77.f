* -----------------------------------------------------------------------
*  TCOM - TCF Calculation on MPICH
* 
*  This software is distributed under the GNU General Public License.
*  See the README file in the top-level directory.
* -----------------------------------------------------------------------
*  | File Name : startend_f77.f
*  | Creation Time : 
*  | Last Modified : 2012-11-13 15:16:46
* -----------------------------------------------------------------------
      subroutine startend_f77(myid,nproc,is1,is2,istart,iend)
      implicit none
      integer myid,nproc,is1,is2,istart,iend,iblock,ir,ilength
      ilength=is2-is1+1
      iblock=ilength/nproc
      ir=ilength-iblock*nproc
      if(myid.lt.ir)then
        istart=is1+myid*(iblock+1)
        iend=istart+iblock
      else
        istart=is1+myid*iblock+ir
        iend=istart+iblock-1
      endif
      if(ilength.lt.1) then
        istart=1
        iend=0
      endif
      return
      end


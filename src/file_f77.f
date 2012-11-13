* -----------------------------------------------------------------------
*  TCOM - TCF Calculation on MPICH
*
*  This software is distributed under the GNU General Public License.
*  See the README file in the top-level directory.
* -----------------------------------------------------------------------
*  | File Name : file_f77.f
*  | Creation Time : 2012-11-09 16:37:26
*  | Last Modified : 2012-11-13 15:16:28
* -----------------------------------------------------------------------

      subroutine file_f77()
      implicit none
      include "../include/tcom_f77.h"
      include "../include/file_f77.h"
      integer par_num
      character*80 par_name(par_num_max),file_name(par_num_max),
     &file_par(par_num_max)
      real*8 par_val(par_num_max)
      logical file_exist
      open(21,file="tcom.dat",status="old")
      par_num=0
100   par_num=par_num+1
      read(21,*,end=99) par_name(par_num),par_val(par_num)
      goto 100
99    close(21)
      do I0=1,par_num
        if(par_name(I0).eq."time_per_step")
     &time_per_step=par_val(I0)
        if(par_name(I0).eq."start_point")  ! Preserved! This function has not been implemented in the program.
     &start_point=dint(par_val(I0))
        if(par_name(I0).eq."end_point")
     &end_point=dint(par_val(I0))
        if(par_name(I0).eq."window_step_num")
     &window_step_num=dint(par_val(I0))
        if(par_name(I0).eq."print_step")   ! Preserved! This function has not been implemented in the program.
     &print_step=dint(par_val(I0))   
      enddo
      open(22,file="file.dat",status="old")
      par_num=0
101   par_num=par_num+1
      read(22,*,end=102) file_par(par_num),file_name(par_num)
      goto 101
102   close(22)
      do I0=1,par_num
        if(file_par(I0).eq."input_file_name")
     &input_file_name=file_name(I0)
        if(file_par(I0).eq."output_file_name")
     &output_file_name=file_name(I0)
      enddo
C-------initialize the lock file----------------
      open(23,file="unlock",status="replace")
      call check_time_label
      write(23,"(A14,1x,F15.6)")"Starting time=",time_label 
      close(23)
      open(24,file="lock",status="replace")
      close(20,status="delete")
      return
      end

      subroutine read_file_f77()  ! Read the source file
      implicit none
      include "../include/tcom_f77.h"
      include "../include/file_f77.h"
      include "../include/mom_f77.h"
      integer par_num
      character read_char(par_num_max)*30,dummy*1
      real*8 read_val(par_num_max)
      write(*,*) myid, " Start reading input file=",
     &input_file_name
      open(21,file=input_file_name,status="old")
      read(21,*)dummy,file_type,par_num
     &,(read_char(I0),read_val(I0),I0=1,par_num)
      if(file_type.eq."mom")then    !  for moments only
        do I0=1,par_num
          if(read_char(I0).eq."file_x_dim")
     &file_x_dim=dint(read_val(I0))
          if(read_char(I0).eq."file_y_dim")
     &file_y_dim=dint(read_val(I0))
          if(read_char(I0).eq."file_z_dim")
     &file_z_dim=dint(read_val(I0))
          if(read_char(I0).eq."total_moment_x_num")
     &total_moment_x_num=dint(read_val(I0))
          if(read_char(I0).eq."total_moment_y_num")
     &total_moment_y_num=dint(read_val(I0))
          if(read_char(I0).eq."total_moment_z_num")
     &total_moment_z_num=dint(read_val(I0))
        enddo
        if(end_point.eq.-1)end_point=file_x_dim
        total_data_num=end_point-start_point+1
        write(*,*) myid," There are ",file_x_dim,
     &" data points in the source file"
        write(*,*) myid," Start reading file from step=",start_point
        read(21,*)
        read(21,*)
        read(21,*)
        read(21,*)
        do I1=1,start_point-1
          read(21,*)
        enddo
        if(window_step_num.eq.-1)window_step_num=total_data_num-1
        do I1=1,total_data_num
          read(21,*)time(I1),frame(I1),
     &mom1(I1),mom2(I1),mom3(I1),mom4(I1),mom5(I1),mom6(I1),
     &mom7(I1),mom8(I1),mom9(I1),mom10(I1),mom11(I1),mom12(I1),
     &mom13(I1),mom14(I1),mom15(I1),mom16(I1)
        enddo
      endif
      close(21)
      write(*,*) myid, " Reading ",total_data_num," complete!"

      return
      end

      subroutine check_time_label
C     date.time ==> format F15.6 for time_label
      implicit none
      include "../include/tcom_f77.h"
      integer today(3),now(3)
      call idate(today)
      call itime(now)
      time_label=dble(today(3))*1.D4+dble(today(2))*1.D2+dble(today(1))+
     &dble(now(1))*1.D-2+dble(now(2))*1.D-4+dble(now(3))*1.D-6
      return
      end

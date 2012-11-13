C/* ----------------------------------------------------------------------
C   TCOM - TCF calculation on MPICH
C                                 
C   This software is distributed under the GNU General Public License. 
C   See the README file in the top-level sophAi directory.
C-------------------------------------------------------------------------
C   | File Name : file_f77.h
C   | Creation Time : 2012-11-09 14:30:50
C   | Last Modified : 2012-11-12 13:18:25
C------------------------------------------------------------------------- */
      integer file_x_dim,file_y_dim,file_z_dim, atom_num
      common /file_int0/ file_x_dim,file_y_dim,file_z_dim,atom_num
      integer total_moment_y_num,total_moment_z_num,total_moment_x_num
      common /file_int1/ total_moment_y_num,total_moment_z_num,
     &total_moment_x_num
      character file_type*3,input_file_name*80,output_file_name*80
      common /file_char0/ file_type,input_file_name,output_file_name
      

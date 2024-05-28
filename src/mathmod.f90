module mathmod
  !! module with math functions

  implicit none

  contains

  integer function mult_int(a,b)
    !! Multiplies two integers $$a*b = c$$
    ! Arguments:
    integer, intent(in) :: a
      !! first term
    integer, intent(in) :: b
      !! second turn

      mult_int = a * b

  end function mult_int


endmodule mathmod
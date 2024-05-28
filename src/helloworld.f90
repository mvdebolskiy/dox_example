program hello_world
  !! This is hello_world program

  use mathmod

  implicit none

  !! @note
  !!  поддерживает много языков
  !! @endnote
  integer :: a,b,c
  ! This is just a normal comment
  call say_hello("World!")

  a = 10

  b = 20

  c = mult_int(a,b)


contains

  subroutine say_hello(name)
    !! subroutine to say hello world
    character(len=*), intent(in) :: name
      !! Who to say hello to
    write(*, '("Hello, ", a)') name
  end subroutine say_hello


end program hello_world
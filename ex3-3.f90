program SolarSystem
  implicit none
  type :: Vector2d
    real(8) :: x,y
  end type Vector2d

  type AstronomicalObject
      type(Vector2d) :: posi, velo, accl
      real(8)        :: mass
      character(256) :: name
  end type AstronomicalObject

  integer,parameter :: input_unit = 149
  integer,parameter :: output_unit = 697
  real(8),parameter :: Astronomicalunit = 1.496d11

  type(AstronomicalObject),allocatable :: stars(:)
  integer :: i,j,N
  N=3
  allocate(stars(N))
  open(unit = input_unit, file = 'planet.dat', action='read')
  do i=1,N
    read(input_unit,*) stars(i)%name,stars(i)%posi%x,stars(i)%mass,stars(i)%velo%y
    stars(i)%posi%y = 0d0
    stars(i)%velo%x = 0d0
    stars(i)%accl = Vector2d(0d0,0d0)
  end do
  close(input_unit)

  open(unit = output_unit, file = 'aaaaa.txt', action='write')
  do i=1,N
    write(output_unit,*) stars(i)%posi%x/Astronomicalunit,stars(i)%posi%y/Astronomicalunit
  end do
  close(output_unit)
end program SolarSystem

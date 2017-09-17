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

  type(AstronomicalObject) :: earth
  open(unit = input_unit, file = 'planet.dat', action='read')
  read(input_unit,*) earth%name,earth%posi%x,earth%mass,earth%velo%y
  earth%posi%y = 0d0
  earth%velo%x = 0d0
  earth%accl = Vector2d(0d0,0d0)
  close(input_unit)

  open(unit = output_unit, file = trim(earth%name)//'.txt', action='write')
  write(output_unit,*) earth%posi%x/Astronomicalunit,earth%posi%y/Astronomicalunit
  close(output_unit)
end program SolarSystem

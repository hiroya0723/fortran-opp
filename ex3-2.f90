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

  type(AstronomicalObject) :: earth
  earth%posi = Vector2d(1.496d11, 0d0)
  earth%velo = Vector2d(0d0, 29.78d3)
  earth%accl = Vector2d(0d0, 0d0)
  earth%mass = 5.97d24
  earth%name = "Earth"
end program SolarSystem

program test_qsort
  use mod_qsort
  implicit none
  integer :: a(10)

  a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  call qsort(a)
  print *, a

end program test_qsort

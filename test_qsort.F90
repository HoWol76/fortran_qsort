program test_qsort
  use mod_qsort
  implicit none
  integer, allocatable :: a(:)
  real, allocatable :: b(:)

  allocate(a(10))
  a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  call qsort(a)
  call check_a("Already Sorted")
  deallocate(a)

  allocate(a(1))
  a = [1]
  call qsort(a)
  call check_a("Single Element")
  deallocate(a)

  allocate(a(2))
  a = [2, 1]
  call qsort(a)
  call check_a("Two Elements")
  a = [2, 2]
  call qsort(a)
  call check_a("Two identical Elements")
  deallocate(a)

  allocate(a(3))
  a = [1, 3, 2]
  call qsort(a)
  call check_a("Largest Element pivot")
  a = [3, 1, 2]
  call qsort(a)
  call check_a("Smallest Element pivot")
  deallocate(a)

  allocate(a(-1:1))
  a = [-1, 1, 0]
  call qsort(a)
  call check_a("indices not starting at 1")
  deallocate(a)

  allocate(b(3))
  b = [5.4, -9.1, 0.3]
  call qsort(b)
  call check_b("3-element real")
  deallocate(b)

contains
  subroutine check_a(test)
    character(len=*), intent(in) :: test
    integer :: l, u
    l = lbound(a, dim=1)
    u = ubound(a, dim=1)
    if (.not. all(a(l:u-1) - a(l+1:u) <= 0)) then
      print *, "Failed in " // test
      print '(*(I4))', a
    endif
  end subroutine check_a
  subroutine check_b(test)
    character(len=*), intent(in) :: test
    integer :: l, u
    l = lbound(b, dim=1)
    u = ubound(b, dim=1)
    if (.not. all(b(l:u-1) - b(l+1:u) <= 0)) then
      print *, "Failed in " // test
      print '(*(F6.1))', b
    endif
  end subroutine check_b
end program test_qsort

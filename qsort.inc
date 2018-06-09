#if defined(__GFORTRAN__) || defined(NAGFOR)
#define PASTE(a) a
#define ADD_TRAIL_USCORE(a) PASTE(a)_
#define CAT(a,b) ADD_TRAIL_USCORE(a)b
#else
#define PASTE(a,b) a ## _ ## b
#define CAT(a,b) PASTE(a,b)
#endif

#define QSORT CAT(qsort,VAR_KIND)
#define SWAP CAT(swap,VAR_KIND)

  recursive subroutine QSORT(a, first, last)
    implicit none
    VAR_TYPE(kind=VAR_KIND), intent(inout) :: a(:)
    integer, intent(in), optional :: first, last
    integer :: i, j, f, l
    VAR_TYPE(kind=VAR_KIND) :: pivot

    if ( present(first) ) then
      f = first
    else
      f = lbound(a, dim=1)
    endif

    if ( present(last) ) then
      l = last
    else
      l = ubound(a, dim=1)
    end if

    if (l <= f) return ! less than two elements means it is already sorted

    if (l == f+1) then ! two elements, check whether they're in order.
      if ( a(l) < a(f) ) then
        call SWAP(a, l, f)
      end if
      return
    endif

    ! move middle element to front as pivot
    call SWAP(a, f, (f+l)/2)
    pivot = a(f)

    i = f + 1
    j = l

    do while ( j >= i )
      do while ( a(i) < pivot )
        i = i + 1
      end do
      do while ( a(j) > pivot )
        j = j - 1
      end do
      if ( j < i ) exit
      call SWAP(a, i, j)
      j = j - 1
      i = i + 1
    end do

    call SWAP(a, f, j)
    call QSORT(a, f, j-1)
    call QSORT(a, i, l)

  end subroutine QSORT

  subroutine SWAP(a, i, j)

    implicit none
    VAR_TYPE(kind=VAR_KIND), intent(inout) :: a(:)
    integer, intent(in) :: i, j
    VAR_TYPE(kind=VAR_KIND) :: t

    t = a(i)
    a(i) = a(j)
    a(j) = t

end subroutine SWAP

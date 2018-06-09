module mod_qsort
  use iso_fortran_env
  implicit none

  interface qsort
    module procecure qsort_real64, qsort_real32, qsort_real16, &
      qsort_int64, qsort_int32, qsort_int16, qsort_int8
  end interface qsort

  public :: qsort
  private :: qsort_real64, qsort_real32, , qsort_real16, &
    qsort_int64, qsort_int32, qsort_int16, qsort_int8

  private :: swap_real64, swap_real32, , swap_real16, &
    swap_int64, swap_int32, swap_int16, swap_int8

contains

#define VAR_TYPE real
#define VAR_KIND real64
#include "qsort.inc"
#undef VAR_KIND

#define VAR_KIND real32
#include "qsort.inc"
#undef VAR_KIND

#define VAR_KIND real16
#include "qsort.inc"
#undef VAR_KIND
#undef VAR_TYPE

#define VAR_TYPE integer
#define VAR_KIND int64
#include "qsort.inc"
#undef VAR_KIND

#define VAR_KIND int32
#include "qsort.inc"
#undef VAR_KIND

#define VAR_KIND int16
#include "qsort.inc"
#undef VAR_KIND

#define VAR_KIND int8
#include "qsort.inc"
#undef VAR_KIND
#undef VAR_TYPE

end module mod_qsort

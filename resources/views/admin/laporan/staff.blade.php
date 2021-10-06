@extends('layouts.admin.main')
@section('title', 'Order')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Laporam Staf</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Admin</a></li>
              <li class="breadcrumb-item">Laporan</li>
              <li class="breadcrumb-item active">Staf</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- title row -->


      <!-- Table row -->
     <div class="card">
         <div class="card-body">
            <div class="row">
                <div class="col-12">
                    <h2 class="page-header">
                      <small class="float-right">Date: {{ $dari->format('d F Y') }} - {{ $sampai->format('d F Y') }}</small>
                    </h2>
                  </div>
                <div class="col-12 table-responsive">
                  <table id="example2" class="table table-sm table-striped">
                    <thead>
                    <tr>
                      <th>#</th>
                      <th>Staff</th>
                      <th>Melayani</th>
                      <th>Jumlah</th>
                    </tr>
                    </thead>
                    <tbody>
                        @foreach($staff as $staff)
                          <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $staff->first_name }}</td>
                            <td>{{ $orders->where('staff', $staff->id)->count() }} x</td>
                            <td>{{ $orders->where('staff', $staff->id)->sum('gross') }} K</td>
                          </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="2" class="text-center">Total</th>
                            <th>{{ $orders->count() }} x</th>
                            <th>{{ $orders->sum('gross') }} K</th>
                        </tr>
                    </tfoot>
                  </table>
                </div>
                <!-- /.col -->
              </div>
         </div>
     </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- ./wrapper -->
  <!-- Page specific script -->
  @push('style')
  <!-- DataTables -->
  <link rel="stylesheet" href="{{ asset('admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
  <link rel="stylesheet" href="{{ asset('admin/plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}">
  <link rel="stylesheet" href="{{ asset('admin/plugins/datatables-buttons/css/buttons.bootstrap4.min.css') }}">
  @endpush

  @push('script')
  <!-- DataTables  & Plugins -->
  <script src="{{ asset('admin/plugins/datatables/jquery.dataTables.min.js') }}"></script>
  <script src="{{ asset('admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
  <script src="{{ asset('admin/plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
  <script src="{{ asset('admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js') }}"></script>
  <script src="{{ asset('admin/plugins/datatables-buttons/js/dataTables.buttons.min.js') }}"></script>
  <script src="{{ asset('admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js') }}"></script>
  <script src="{{ asset('admin/plugins/jszip/jszip.min.js') }}"></script>
  <script src="{{ asset('admin/plugins/pdfmake/pdfmake.min.js') }}"></script>
  <script src="{{ asset('admin/plugins/pdfmake/vfs_fonts.js') }}"></script>
  <script src="{{ asset('admin/plugins/datatables-buttons/js/buttons.html5.min.js') }}"></script>
  <script src="{{ asset('admin/plugins/datatables-buttons/js/buttons.print.min.js') }}"></script>
  <script src="{{ asset('admin/plugins/datatables-buttons/js/buttons.colVis.min.js') }}"></script>
  <script>
    $(function () {
      $("#example1").DataTable({
        "scrollX": true,
      });
      $('#example2').DataTable({
        "paging": true,
        dom: 'Bfrtip',
        buttons: [
              'copy', 'csv', 'excel', 'pdf', 'print'
          ],
        "lengthChange": true,
        "searching":true,
        "ordering": true,
        "info": true,
        "autoWidth": true,
        "responsive": true,
      });
    });
  </script>
  @endpush
@endsection

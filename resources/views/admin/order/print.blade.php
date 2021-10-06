<!DOCTYPE html>
<html>
<body>
    <div class="content-wrapper" style="max-width: 185px;width: 185px;height: 300px;max-height: 300px;font-size: 11px; ">
        <!-- Main content -->
        <div style="padding-left: 10px;padding-right: 10px">

            <section class="content">

                <div class="container-fluid">
                  <div class="row">
                    <div class="col-12">
                      <!-- Default box -->
                      <div class="card">
                          <!-- /.card-header -->

                          <div class="card-body">
                            <div class="row">
                                <div style="text-align: center">
                                    <table >
                                        <tr>
                                            <td>
                                                <div style="width: 40px;height: 40px;">

                                                    <img style="border-radius: 50%;width: 100%" src="{{url('img/logo2.jpeg')}}" alt="" srcset="">
                                                </div>
                                            </td>
                                            <td style="text-align: center">
                                                <div style="padding-left: 5px">
                                                    <div style="font-size: 14px"><strong>K.E.N</strong></div>
                                                    <div style="font-size: 12px"><strong>Barber And Coffee</strong></div>
                                                    <div style="font-size: 9px">Jl KH Agus Salim No. 42A</div>
                                                    <div style="font-size: 9px">No Telp : 089515813133</div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <hr style="border-top: 3px double #8c8b8b;">
                                <br>
                              <div class="col-md-4" >
                               <strong>{{ $order->code }}</strong>
                              </div>
                              {{-- <div class="col-md-4">
                                Name : <strong>{{ $order->client->first_name }}</strong>
                              </div> --}}
                              <div class="col-md-4">
                                Tanggal: <strong>{{ $order->date->format('d F Y') }} {{ $order->time->jam??'' }}</strong>
                              </div>
                            </div>
                            <hr>
                            <div class="row">
                             <table class="table table-striped table-sm" width="100%">
                              <tr>
                                <th style="text-align: left">#</th>
                                <th style="text-align: left">SERVICE</th>
                                <th style="text-align: center">PRICE</th>
                                <th style="text-align: center">QTY</th>
                                <th style="text-align: center">SUB TOTAL</th>
                              </tr>
                              @php $total = 0; $quantity = 0; @endphp
                              @foreach($order->service as $service)
                                @php $total += $service->price * $service->pivot->qty @endphp
                                @php $quantity += $service->pivot->qty @endphp
                              <tr>
                                <td style="text-align: left">{{ $loop->iteration }}</td>
                                <td style="text-align: left">{{ $service->name }}</td>
                                <td style="text-align: center">{{ $service->price }} K</td>
                                <td style="text-align: center">{{ $service->pivot->qty }}</td>
                                <td style="text-align: center">{{ $service->pivot->total }} K</td>
                              </tr>
                              @endforeach
                              <tr>
                                  <td colspan="4"></td>
                                  <td>
                                      <hr>
                                  </td>
                              </tr>

                              <tr>
                                <th colspan="2" style="text-align: left">TOTAL</th>
                                <th></th>
                                <th></th>
                                <th>{{ $total }} K</th>
                                </tr>
                            </table>
                            <hr>
                              <br>
                            <div><b>Barber Staff</b></div>
                            <div class="col-md-4">
                              Nama : {{ $order->employee->first_name }}
                            </div>

                            <div class="col-md-4">
                              Pembayaran : {{ $order->payment->bank }}{{ $order->payment->an!=null ? ' | '.$order->payment->an:''}}{{ $order->payment->norek != null ? ' | '.$order->payment->norek:''}}
                            </div>
                            <br>
                            <br>
                            <div style="text-align: center">
                                Terimkasih ..
                            </div>
                          </div>
                          </div>
                          </div>
                          <!-- /.card-body -->
                        </div>
                      <!-- /.card -->
                    </div>
                  </div>
                </div>
              </section>
        </div>
        <!-- /.content -->
    </div>
<style>
    @media print
{
   @page
   {
    size: 8.5in 5.5in;
    size: portrait;
  }
}
#plugin {
    height: 100%;
    position: absolute;
    width: 100%;
}
</style>
</body>
<script>
    window.print();
</script>
</html>

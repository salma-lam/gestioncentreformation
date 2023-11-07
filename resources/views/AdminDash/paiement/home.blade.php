<!-- right content -->

@include ('AdminDash.includesAdmin.header')
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
@section('body')
            <h1 class="mb-0">Liste des paiements</h1><br><br>
        @if(Session::has('success'))
            <div class="alert alert-success" role="alert">
                {{ Session::get('success') }}
            </div>
        @endif
        <input id="myInput" type="text" class="form-control input-text" placeholder="Chercher un paiement...." aria-label="Recipient's username" aria-describedby="basic-addon2">
        <br><br>
        <table class="table table-hover">
            <thead class="table-primary">
                <tr>
                    <th>Id</th>
                    <th>Formation</th>
                    <th>Etudiant</th>
                    <th>Montant</th>
                    <th>Reste</th>                        
                    <th>Date de paiement</th>
                </tr>
            </thead>
            <tbody id="myTable">
                @if($paiements->count() > 0)
                    @foreach($paiements as $p)
                        <tr>
                            <td class="align-middle">{{ $loop->iteration }}</td>
                            <td class="align-middle">{{ $p->formation->specialite }}&nbsp; &nbsp; {{ $p->formation->periode }}&nbsp; &nbsp; {{ $p->formation->prix }} DH</td>
                            <td class="align-middle">{{ $p->etudiant->prenom }} {{ $p->etudiant->prenom }}</td>
                            <td class="align-middle">{{ $p->montant }} DH</td>
                            <td class="align-middle">{{ $p->reste }} DH</td>                                
                            <td class="align-middle">{{ $p->datePaiement }}</td>
                        </tr>
                    @endforeach
                    {{ $paiements->links() }}
                 @else
                    <tr>
                        <td class="text-center" colspan="5">Paiement introuvable</td>
                    </tr>
                @endif

            </tbody>
        </table>
    <!-- Search bar -->
        <script>
            $(document).ready(function(){
            $("#myInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
            });
        </script>
    <!-- End search bar -->
        @endsection  
    </div>
</div>
<div class="container">
    <div class="row"  style="width: -300px;margin-left: 20%;margin-top: 10%;">
    <div class="col">
        @yield('body')
    </div>
    </div>
</div>
<!-- end right content-->

@include ('AdminDash.includesAdmin.footer')

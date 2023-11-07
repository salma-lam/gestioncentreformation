<!-- right content -->
    
@include ('AdminDash.includesAdmin.header')
@section('body')
    <!-- <div class="d-flex align-items-center justify-content-between">  -->
        <h1 class="mb-0">Liste des formations des étudiants</h1>
        <a href="/etudiantFormationCreate/{{$id}}" class="btn btn-primary">Ajouter formation étudiant</a>
        <br><br>
        @if(Session::has('success'))
            <div class="alert alert-success" role="alert">
                {{ Session::get('success') }}
            </div>
        @endif
            <table class="table table-hover">
                <thead class="table-primary">
                    <tr>
                        <th>Id</th>                        
                        <th>Etudiant</th>
                        <th>Fomation</th>
                        <th>Nouveau prix</th>
                    </tr>
                </thead>
                <tbody>
                      @if($etudiantFormation->count() > 0)
                        @foreach($etudiantFormation as $ef)
                            <tr>
                                <td class="align-middle">{{ $loop->iteration }}</td>
                                <td class="align-middle">{{ $ef->etudiant->prenom }} {{ $ef->etudiant->nom }}</td>
                                <td class="align-middle">{{ $ef->formation->specialite}} --- {{ $ef->formation->periode}} --- {{ $ef->formation->prix}} DH</td>
                                <td class="align-middle">{{ $ef->nvPrix }} DH</td>
                                <td class="align-middle">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                        <a href="/etudiantFormationShow/{{$ef->id}}" type="button" class="btn btn-secondary">Détaille</a>
                                        <a href="/etudiantFormationUpdate/{{$ef->id}}" type="button" class="btn btn-warning">Modifier</a>
                                        <form action="/etudiantFormationDestroy/{{$ef->id}}/1" method="POST" type="button" class="btn btn-danger p-0" onsubmit="return confirm('Delete?')">
                                            @csrf
                                            <button class="btn btn-danger m-0">Supprimer</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    @else
                        <tr>
                            <td class="text-center" colspan="5">Formation étudiant introuvable</td>
                        </tr>
                    @endif
                </tbody>
            </table>
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
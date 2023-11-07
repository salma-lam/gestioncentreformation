<!-- right content -->
    
@include ('AdminDash.includesAdmin.header')
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
@section('body')
           <!-- <div class="d-flex align-items-center justify-content-between">  -->
                <h1 class="mb-0">Liste des étudiants</h1>
                <a href="{{ route('etudiant.create') }}" class="btn btn-primary">Ajouter un étudiant</a>
            <br><br>
            @if(Session::has('success'))
                <div class="alert alert-success" role="alert">
                    {{ Session::get('success') }}
                </div>
            @endif
            <!-- Search bar -->
             <form action="/etudiant">
                <div class="relative border-2 border-gray-100 m-4 rounded-lg">
                    <input type="text" name="search" class="h-14 w-full pl-10 pr-20 rounded-lg z-0 focus:shadow focus:outline-none"
                        placeholder="Chercher un étudiant..." />
                        <button type="submit" class="h-10 w-20 text-black rounded-lg bg-red-500 hover:bg-red-600">
                            Chercher
                        </button>
                    </div>
                </div>
              </form>
            <!-- End Search bar -->
            <br><br>
            <table class="table table-hover" id="table1">
                <thead class="table-primary">
                    <tr>
                        <th>Id</th>
                        <th>Prenom</th>
                        <th>Nom</th>
                        <th>Email</th>
                        <th>Numéro de téléphone</th>
                        <th>CIN</th>
                    </tr>
                </thead>
                <tbody id="myTable">
                    @if($etudiants->count() > 0)
                        @foreach($etudiants as $e)
                            <tr>
                                <td class="align-middle">{{ $loop->iteration }}</td>
                                <td class="align-middle">{{ $e->prenom}}</td>
                                <td class="align-middle">{{ $e->nom }}</td>
                                <td class="align-middle">{{ $e->email }}</td>
                                <td class="align-middle">0{{ $e->tel }}</td>
                                <td class="align-middle">{{ $e->CIN }}</td>
                                <td class="align-middle">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                        <a href="{{ route('etudiant.show', $e->id) }}" type="button" class="btn btn-secondary">Détaille</a>
                                        <a href="{{ route('etudiant.edit', $e->id)}}" type="button" class="btn btn-warning">Modifier</a>
                                        <a href="etudiantFormationCreate/{{$e->id}}" type="button" class="btn btn-info">Formation</a>
                                        <a href="etudiantGroupeFormationCreate/{{$e->id}}" type="button" class="btn btn-success">Groupe formation</a>
                                        <a href="paiementCreate/{{$e->id}}" type="button" class="btn btn-dark">Paiement </a>
                                        <form action="{{ route('etudiant.destroy', $e->id) }}" method="POST" type="button" class="btn btn-danger p-0" onsubmit="return confirm('Delete?')">
                                            @csrf
                                            @method('DELETE')
                                            <button class="btn btn-danger m-0">Supprimer</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        {{ $etudiants->links() }}
                        @else
                        <tr>
                            <td class="text-center" colspan="5">Etudiant introuvable</td>
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
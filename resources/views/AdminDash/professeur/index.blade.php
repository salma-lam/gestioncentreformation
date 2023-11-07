<!-- right content -->
@include ('AdminDash.includesAdmin.header')
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
        @section('body')
           <!-- <div class="d-flex align-items-center justify-content-between">  -->
                <h1 class="mb-0">Liste des professeurs</h1>
                <a href="{{ route('professeur.create') }}" class="btn btn-primary">Ajouter un professeur</a>
            <br><br>
            @if(Session::has('success'))
                <div class="alert alert-success" role="alert">
                    {{ Session::get('success') }}
                </div>
            @endif
            <!-- Search bar -->
            <form action="/professeur">
                <div class="relative border-2 border-gray-100 m-4 rounded-lg">
                    <input type="text" name="search" class="h-14 w-full pl-10 pr-20 rounded-lg z-0 focus:shadow focus:outline-none"
                        placeholder="Chercher un professeur..." />
                        <button type="submit" class="h-10 w-20 text-black rounded-lg bg-red-500 hover:bg-red-600">
                            Chercher
                        </button>
                    </div>
                </div>
                </form>
            <!-- End Search bar -->
            <table class="table table-hover">
                <thead class="table-primary">
                    <tr>
                        <th>Id</th>
                        <th>Prenom</th>
                        <th>Nom</th>
                        <th>Email</th>
                        <th>Numéro de téléphone</th>
                    </tr>
                </thead>
                <tbody id="myTable">
                    @if($professeurs->count() > 0)
                        @foreach($professeurs as $p)
                            <tr>
                                <td class="align-middle">{{ $loop->iteration }}</td>
                                <td class="align-middle">{{ $p->prenom}}</td>
                                <td class="align-middle">{{ $p->nom }}</td>
                                <td class="align-middle">{{ $p->email }}</td>
                                <td class="align-middle">0{{ $p->tel }}</td>
                                <td class="align-middle">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                        <a href="{{ route('professeur.show', $p->id) }}" type="button" class="btn btn-secondary">Détaille</a>
                                        <a href="{{ route('professeur.edit', $p->id)}}" type="button" class="btn btn-warning">Modifier</a>
                                        <a href="matiereProfesseurCreate/{{$p->id}}" type="button" class="btn btn-info">Matiére</a>
                                        <a href="groupeFormationProfesseurCreate/{{$p->id}}" type="button" class="btn btn-success">Groupe formation</a>
                                        <form action="{{ route('professeur.destroy', $p->id) }}" method="POST" type="button" class="btn btn-danger p-0" onsubmit="return confirm('Delete?')">
                                            @csrf
                                            @method('DELETE')
                                            <button class="btn btn-danger m-0">Supprimer</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        {{ $professeurs->links() }}
                    @else
                        <tr>
                            <td class="text-center" colspan="5">Professeur introuvable</td>
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

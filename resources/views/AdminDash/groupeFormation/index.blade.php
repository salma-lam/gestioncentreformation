<!-- right content -->
    
@include ('AdminDash.includesAdmin.header')
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
@section('body')
           <!-- <div class="d-flex align-items-center justify-content-between">  -->
                <h1 class="mb-0">Liste des groupes de formation</h1>
                <a href="{{ route('groupeFormation.create') }}" class="btn btn-primary">Ajouter un groupe de formation</a>
            <br><br>
            @if(Session::has('success'))
                <div class="alert alert-success" role="alert">
                    {{ Session::get('success') }}
                </div>
            @endif
            <!-- Search bar -->
            <form action="/groupeFormation">
                <div class="relative border-2 border-gray-100 m-4 rounded-lg">
                    <input type="text" name="search" class="h-14 w-full pl-10 pr-20 rounded-lg z-0 focus:shadow focus:outline-none"
                        placeholder="Chercher un groupe de formation..." />
                        <button type="submit" class="h-10 w-20 text-black rounded-lg bg-red-500 hover:bg-red-600">
                            Chercher
                        </button>
                    </div>
                </div>
              </form>
            <!-- End Search bar -->            
            <br><br>
            <table class="table table-hover">
                <thead class="table-primary">
                    <tr>
                        <th>Id</th>
                        <th>Groupe de formation</th>
                        <th>Formation</th>
                </thead>
                <tbody id="myTable">
                    @if($groupeFormations->count() > 0)
                        @foreach($groupeFormations as $gf)
                            <tr>
                                <td class="align-middle">{{ $loop->iteration }}</td>
                                <td class="align-middle">{{ $gf->nomGroupe}}</td>
                                <td class="align-middle">{{ $gf->formation->specialite }}&nbsp &nbsp &nbsp{{ $gf->formation->periode }}&nbsp &nbsp &nbsp{{ $gf->formation->prix }} DH</td>
                                <td class="align-middle">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                        <a href="{{ route('groupeFormation.show', $gf->id) }}" type="button" class="btn btn-secondary">Détaille</a>
                                        <a href="{{ route('groupeFormation.edit', $gf->id)}}" type="button" class="btn btn-warning">Modifier</a>
                                        <form action="{{ route('groupeFormation.destroy', $gf->id) }}" method="POST" type="button" class="btn btn-danger p-0" onsubmit="return confirm('Delete?')">
                                            @csrf
                                            @method('DELETE')
                                            <button class="btn btn-danger m-0">Supprimer</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        {{ $groupeFormations->links() }}
                    @else
                        <tr>
                            <td class="text-center" colspan="5">Groupe de formation introuvable</td>
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


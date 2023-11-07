<!-- right content -->
    
@include ('AdminDash.includesAdmin.header')
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
@section('body')
           <!-- <div class="d-flex align-items-center justify-content-between">  -->
                <h1 class="mb-0">Liste des salles</h1>
                <a href="{{ route('salle.create') }}" class="btn btn-primary">Ajouter une salle</a>
            <br><br>
            @if(Session::has('success'))
                <div class="alert alert-success" role="alert">
                    {{ Session::get('success') }}
                </div>
            @endif
            <!-- Search bar -->
            <form action="/salle">
                <div class="relative border-2 border-gray-100 m-4 rounded-lg">
                    <input type="text" name="search" class="h-14 w-full pl-10 pr-20 rounded-lg z-0 focus:shadow focus:outline-none"
                        placeholder="Chercher une salle..." />
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
                        <th>Nom de la salle</th>
                        <th>Capacité de la salle</th>
                        <th>Type de la salle</th>
                    </tr>
                </thead>
                <tbody id="myTable">
                    @if($salles->count() > 0)
                        @foreach($salles as $sl)
                            <tr>
                                <td class="align-middle">{{ $loop->iteration }}</td>
                                <td class="align-middle">{{ $sl->nomSalle}}</td>
                                <td class="align-middle">{{ $sl->capacite }}</td>
                                <td class="align-middle">{{ $sl->type }}</td>
                                <td class="align-middle">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                        <a href="{{ route('salle.show', $sl->id) }}" type="button" class="btn btn-secondary">Détaille</a>
                                        <a href="{{ route('salle.edit', $sl->id)}}" type="button" class="btn btn-warning">Modifier</a>
                                        <form action="{{ route('salle.destroy', $sl->id) }}" method="POST" type="button" class="btn btn-danger p-0" onsubmit="return confirm('Delete?')">
                                            @csrf
                                            @method('DELETE')
                                            <button class="btn btn-danger m-0">Supprimer</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        {{ $salles->links() }}
                    @else
                        <tr>
                            <td class="text-center" colspan="5">Salle introuvable</td>
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


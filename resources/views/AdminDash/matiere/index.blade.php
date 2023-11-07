<!-- right content -->
    
@include ('AdminDash.includesAdmin.header')
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
@section('body')
           <!-- <div class="d-flex align-items-center justify-content-between">  -->
                <h1 class="mb-0">Liste des matiéres</h1>
                <a href="{{ route('matiere.create') }}" class="btn btn-primary">Ajouter une matiére</a>
            <br><br>
            @if(Session::has('success'))
                <div class="alert alert-success" role="alert">
                    {{ Session::get('success') }}
                </div>
            @endif
            <!-- Search bar -->
            <form action="/matiere">
                <div class="relative border-2 border-gray-100 m-4 rounded-lg">
                    <input type="text" name="search" class="h-14 w-full pl-10 pr-20 rounded-lg z-0 focus:shadow focus:outline-none"
                        placeholder="Chercher une matiére..." />
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
                        <th>Nom matiere</th>
                </thead>
                <tbody id="myTable">                    
                    @if($matieres->count() > 0)
                        @foreach($matieres as $gf)
                            <tr>
                                <td class="align-middle">{{ $loop->iteration }}</td>
                                <td class="align-middle">{{ $gf->nomMatiere}}</td>
                                <td class="align-middle">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                        <a href="{{ route('matiere.show', $gf->id) }}" type="button" class="btn btn-secondary">Détaille</a>
                                        <a href="{{ route('matiere.edit', $gf->id)}}" type="button" class="btn btn-warning">Modifier</a>
                                        <form action="{{ route('matiere.destroy', $gf->id) }}" method="POST" type="button" class="btn btn-danger p-0" onsubmit="return confirm('Delete?')">
                                            @csrf
                                            @method('DELETE')
                                            <button class="btn btn-danger m-0">Supprimer</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        {{ $matieres->links() }}
                    @else
                        <tr>
                            <td class="text-center" colspan="5">Matiére introuvable</td>
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


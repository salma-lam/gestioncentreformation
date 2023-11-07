7<!-- right content -->
    
@include ('AdminDash.includesAdmin.header') 
@section('body')
    <h1 class="mb-0">Modifier groupe formation d'étudiant</h1>
    <hr />
    <form action="/etudiantGroupeFormationUpdate/{{$id}}" method="POST">
        @csrf
        <input type="hidden" name="id" value="{{$id}}"> 
        <div class="row mb-3">
            <div class="form-group">
                <label for="groupe_formation_id">Groupe formation :</label>
                <select name="groupe_formation_id" class="form-control @error('groupe_formation_id') is-invalid @enderror">
                    <option value="{{ $etudiantGroupeFormation->groupeFormation->id }}">{{ $etudiantGroupeFormation->groupeFormation->nomGroupe }}</option>
                    @foreach ($groupeFormations as $groupeFormation)
                        <option value="{{ $groupeFormation->id }}" name="groupe_formation_id">{{ $groupeFormation->nomGroupe }}</option>
                    @endforeach
                    @error('groupe_formation_id')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </select>
            </div>
        </div> 
        <div class="row">
            <div class="d-grid">
                <button class="btn btn-warning">Modifier</button>
            </div>
        </div>
    </form>
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
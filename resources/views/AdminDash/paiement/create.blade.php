@include ('AdminDash.includesAdmin.header') 
<head>
    <link href="https://cdn.jsdelivr.net/npm/tom-select@2.0.0-rc.4/dist/css/tom-select.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/tom-select@2.0.0-rc.4/dist/js/tom-select.complete.min.js"></script>
</head>
@section('body')
    <h1 class="mb-0">Ajouter un paiement</h1><br><br>
    <hr />
    <form action="/paiementCreate" method="POST">
        @csrf 
        <input type="hidden" name="etudiant_id" value="{{ $etudiant_id }}">
        <div class="row mb-3">
            <div class="form-group">
                <label for="formation_id">Formation :</label>
                <select name="formation_id" class="form-control @error('formation_id') is-invalid @enderror">
                    <option value="">Sélectionnez une formation</option>
                    @foreach ($formations as $formation)
                        <option value="{{ $formation->id }}" name="formation_id">{{ $formation->specialite }} &nbsp;&nbsp; {{ $formation->periode }} &nbsp;&nbsp; {{ $formation->prix }}</option>
                    @endforeach
                     @error('formation_id')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </select>
            </div>
        </div> 
        <div class="row mb-3">
            <div class="col">
                <label for="formation_id">Date de paiement :</label>
                <input type="date" name="datePaiement" class="form-control @error('datePiement') is-invalid @enderror" placeholder="Date paiement" value="{{old('datePaiement')}}"> 
                @error('dataPaiement')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>
        </div> 
        <div class="row mb-3">
            <div class="col">
                <label for="formation_id">Montant :</label>
                <input type="text" name="montant" class="form-control @error('montant') is-invalid @enderror" placeholder="Montant" value="{{old('montant')}}" step="0.01" required> 
                @error('montant')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>
        </div>   
        <div class="row">
            <div class="d-grid">
                <button class="btn btn-primary">Submit</button>
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
<?php
 
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Paiement;
use App\Models\Etudiant;
use App\Models\EtudiantFormation;
use App\Models\formation;

 
class PaiementController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($id)
    {
        $paiements = Paiement::where('etudiant_id', $id)->orderBy('id', 'ASC')->get();
    
        return view('AdminDash.paiement.index', [
            'paiements' => $paiements,
            'id' => $id, // Pass the $id variable to the view
        ]);
    }
    
 
    
    /**
     * To redirect to all formations of all etudiants
     */
    public function home()
    {   
        $paiements = Paiement::paginate(10);
       // $etudiantGroupeFormations = EtudiantGroupeFormation:: orderBy('id', 'ASC')->get();
        return view('AdminDash.paiement.home', compact('paiements'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create($id)
    {
        $etudiants = Etudiant::all();
        $etudiantFormation = EtudiantFormation::where('etudiant_id', $id)->pluck('formation_id');
        $formations = Formation::whereIn('id', $etudiantFormation)->get();
    
        return view('AdminDash.paiement.create', [
            'etudiants' => $etudiants,
            'formations' => $formations,
            'etudiant_id' => $id, // Pass the $id variable to the view
        ]);
    }
    
 
    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
              // Enregistrez les données dans la table matiéres
        /*      Paiement::create([
                'formation_id' => strip_tags($request->input('groupe_formation_id')),
                'etudiant_id' => strip_tags($request->input('etudiant_id')),
                'montant' => strip_tags($request->input('montant')) , 
                'datePaiement' => strip_tags($request->input('datePaiement')),            
                'reste' => strip_tags($request->input('reste'))
            ]);*/
        

      /*  Paiement::create([
            strip_tags()==> pour nettoyer les données entrées par l'utilisateur dans un formulaire
            'montant' => strip_tags($request->input('montant')) , 
            'datePaiement' => strip_tags($request->input('datePaiement')),            
            'reste' => strip_tags($request->input('reste')),
            'formation_id' => strip_tags($request->input('formation_id')) , 
            'etudiant_id' => strip_tags($request->input('etudiant_id'))
        ]); */

        // Valider les données du formulaire
        $request->validate([
            'montant' => 'required|numeric',
            'formation_id' => 'required|exists:formations,id',
            'datePaiement' => 'required|date',

        ]);

        // Récupérer le prix de la formation choisie
        $formation = Formation::findOrFail($request->input('formation_id'));
        $prixFormation = $formation->prix;

        // Calculer le reste du paiement
        $montantPaye = $request->input('montant');
        $datePaiement = $request->input('datePaiement');
        $formation_id = $request->input('formation_id');
        $etudiant_id = $request->input('etudiant_id');

        $restePaiement = $prixFormation - $montantPaye;

        // Enregistrer les informations de paiement dans la base de données
        $paiement = new Paiement();
        $paiement->montant = $montantPaye;
        $paiement->datePaiement = $datePaiement;
        $paiement->etudiant_id = $etudiant_id;
        $paiement->formation_id = $formation_id;

        $paiement->reste = $restePaiement;
        // Autres champs du paiement...
        $paiement->save();

        return redirect('/paiementIndex/'.$request->input('etudiant_id'))->with('success', 'Paiement de l\'étudiant added successfully');
    }
 
    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $paiement = Paiement::findOrFail($id); 
        return view('AdminDash.paiement.show', compact('paiement'));
    }
 
    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $paiement = Paiement::findOrFail($id);
        $etudiant = Etudiant::findOrFail($paiement->etudiant_id);
        $etudiantFormation = EtudiantFormation::where('etudiant_id', $paiement->etudiant_id)->pluck('formation_id');
        $formations = Formation::whereIn('id', $etudiantFormation)->get();
    
        return view('AdminDash.paiement.edit', [
            'etudiant_id' => $paiement->etudiant_id,
            'formations' => $formations,
            'selectedFormationId' => $paiement->formation_id,
            'paiement' => $paiement,
            'id' => $id, // Pass the $id variable to the view if needed
        ]);
    }
    
    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $paiement = Paiement::findOrFail($id);
        
        // Récupérer le prix de la formation choisie
        $formation = Formation::findOrFail($request->input('formation_id'));
        $prixFormation = $formation->prix;
    
        // Calculer le reste du paiement
        $montantPaye = $request->input('montant');
        $datePaiement = $request->input('datePaiement');
        $formation_id = $request->input('formation_id');
        $etudiant_id = $request->input('etudiant_id');
    
        $restePaiement = $prixFormation - $montantPaye;
    
        // Mettre à jour les informations de paiement dans la base de données
        $paiement->montant = $montantPaye;
        $paiement->datePaiement = $datePaiement;
        $paiement->etudiant_id = $etudiant_id;
        $paiement->formation_id = $formation_id;
        $paiement->reste = $restePaiement;
        // Autres champs du paiement...
    
        $paiement->save();
    
        return redirect('/paiementIndex/'.$paiement->etudiant_id)->with('success', 'Paiement de l\'étudiant updated successfully');
    }
    
 
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, string $id, string $h)
    {
        // findOrFail => récupérer un modèle à partir de sa clé primaire...
        $paiement = Paiement:: findOrFail($id);  
        $a = $paiement->etudiant_id;
        $paiement->delete();
        
        if($h=='1'){
            return redirect('/paiementIndex/'.$a)->with('success', 'Paiement de l\'étudiant deleted successfully');
        }
        else
            return redirect('/paiementHome')->with('success', 'Paiement de l\'étudiant deleted successfully');
    }

}



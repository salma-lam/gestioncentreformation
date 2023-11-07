<?php

namespace App\Http\Controllers;

use App\Models\Etudiant;
use Illuminate\Http\Request;

class RechercheController extends Controller
{
    public function search(Request $request)
    {
        $query = $request->input('query');

        // Perform the search operation on your model and retrieve the filtered list
        $filteredList = Etudiant::where('column', 'LIKE', '%' . $query . '%')
            ->limit(10) // Limit the number of results, adjust as needed
            ->get();

        return response()->json($filteredList);
    }
}

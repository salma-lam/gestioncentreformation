<?php
 
namespace App\Models;
 
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Formation;
use App\Models\Paiement;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Auth\Authenticatable as AuthenticatableTrait;

//class Etudiant extends Model implements Authenticatable  

class Etudiant extends Model implements Authenticatable  
{
    use AuthenticatableTrait;

    use HasFactory;

    protected $table = 'etudiants';
 
    protected $fillable = [
        'prenom',
        'nom',
        'email',
        'pass',
        'dateInscription',
        'tel',
        'adresse',
        'CIN'        
    ];

    public function formations(){
        return $this->belongsToMany(Formation::class,'etudiant_formations');
    }

    public function paiement(){
        return $this->hasMany(Paiement::class);
    }

        
    public function scopeFilter($query, array $filters)
    {
        if ($filters['nom'] ?? false) {
            $query->where('nom', 'like', '%' . $filters['nom'] . '%');
        }

        if ($filters['search'] ?? false) {
            $query->where('prenom', 'like', '%' . $filters['search'] . '%')
                ->orWhere('nom', 'like', '%' . $filters['search'] . '%')
                ->orWhere('email', 'like', '%' . $filters['search'] . '%')
                ->orWhere('CIN', 'like', '%' . $filters['search'] . '%');
        }
    }

}
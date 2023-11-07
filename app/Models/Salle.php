<?php
 
namespace App\Models;
 
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\EmploiTemps;
 
class Salle extends Model
{
    use HasFactory;
 
    protected $fillable = [
        'nomSalle',
        'capacite',
        'type' 
    ];

    public function emploiTemps(){
        return $this->hasMany(EmploiTemps::class);
    }

    public function emploi(){
        return $this->hasMany(Emploi::class);
    }

    public function scopeFilter($query, array $filters)
    {
        if ($filters['nomSalle'] ?? false) {
            $query->where('nomSalle', 'like', '%' . $filters['nomSalle'] . '%');
        }

        if ($filters['search'] ?? false) {
            $query->where('capacite', 'like', '%' . $filters['search'] . '%')
                ->orWhere('nomSalle', 'like', '%' . $filters['search'] . '%')
                ->orWhere('type', 'like', '%' . $filters['search'] . '%');
                    }
    }
}
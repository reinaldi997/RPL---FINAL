<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Report extends Model
{
    protected $table = 'reports';
    protected $primaryKey = 'id_report';
    public $timestamps = false;

    protected $fillable = [
        'kode_laporan', 'pelapor_id', 'assigned_to', 'deskripsi',
        'latitude', 'longitude', 'alamat_lokasi', 'status',
    ];
    protected $casts = [
    
    'created_at' => 'datetime',
    
    ];
    public function pelapor()
    {
        return $this->belongsTo(User::class, 'pelapor_id', 'id_user');
    }

    public function petugas()
    {
        return $this->belongsTo(User::class, 'assigned_to', 'id_user');
    }

    public function evidence()
    {
        return $this->hasMany(ReportEvidence::class, 'report_id', 'id_report');
    }
}
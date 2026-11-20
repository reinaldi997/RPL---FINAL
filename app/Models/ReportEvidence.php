<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ReportEvidence extends Model
{
    protected $table = 'report_evidence';
    protected $primaryKey = 'id_evidence';
    public $timestamps = false;

    protected $fillable = ['report_id', 'uploaded_by', 'evidence_type', 'file_path', 'keterangan'];
}
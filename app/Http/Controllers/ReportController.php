<?php

namespace App\Http\Controllers;

use App\Models\Report;

class ReportController extends Controller
{
    public function index()
    {
        $reports = Report::with('pelapor')
            ->where('status', '!=', 'Dihapus')
            ->orderByDesc('created_at')
            ->get();

        return view('reports.index', compact('reports'));
    }
}

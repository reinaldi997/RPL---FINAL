@extends('layouts.app')

@section('title', 'Beranda - Campus CleanCare')

@section('content')
    <div class="p-5 mb-4 bg-white rounded-3 shadow-sm text-center">
        <h1 class="display-5 fw-bold text-success">Kampus Bersih, Tugas Kita Bersama</h1>
        <p class="lead text-muted">
            Laporkan sampah yang menumpuk di sekitar kampus, pantau penanganannya, dan dukung laporan temanmu.
        </p>
        <a href="/laporan" class="btn btn-success btn-lg">Lihat Laporan</a>
    </div>
@endsection